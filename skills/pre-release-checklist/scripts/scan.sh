#!/usr/bin/env bash
# Read-only pre-release scan. Usage: scan.sh [repo-dir]
# Prints one line per finding: LEVEL|GROUP|MESSAGE  (LEVEL = BLOCKER|WARN|INFO|OK)
# Secret VALUES are never printed, only file:line and the pattern name.
set -u
cd "${1:-.}" || exit 2
git rev-parse --git-dir >/dev/null 2>&1 || { echo "BLOCKER|git|not a git repository"; exit 2; }
say() { echo "$1|$2|$3"; }
any() { for f in "$@"; do [ -e "$f" ] && return 0; done; return 1; }
has() { command -v "$1" >/dev/null 2>&1; }
files() { git ls-files -z --cached --others --exclude-standard; }

# 1. Security ---------------------------------------------------------------
tracked_env=$(git ls-files | grep -E '(^|/)\.env($|\.)' | grep -vE '\.(example|sample|template)$')
[ -n "$tracked_env" ] && say BLOCKER security "env file tracked by git: $(echo $tracked_env)" || say OK security "no real .env tracked"
git check-ignore -q .env 2>/dev/null && say OK security ".env is gitignored" || say WARN security ".env is not gitignored"
any .env.example .env.sample .env.template && say OK security ".env.example present" || {
  grep -rqE 'process\.env\.|os\.environ|env::var|import\.meta\.env' --include='*.{js,ts,py,rs}' . 2>/dev/null \
    && say WARN security "code reads env vars but no .env.example"; }

# name:regex pairs; -I skips binaries, -o would print values so we only use -l/-n and cut
patterns='aws-key:AKIA[0-9A-Z]{16}
private-key:BEGIN (RSA|EC|DSA|OPENSSH|PGP) PRIVATE KEY
github-token:gh[pousr]_[A-Za-z0-9]{36,}
slack-token:xox[baprs]-[A-Za-z0-9-]{10,}
stripe-live:sk_live_[0-9a-zA-Z]{20,}
google-api-key:AIza[0-9A-Za-z_-]{35}
db-uri-with-password:(postgres(ql)?|mysql|mongodb(\+srv)?|redis|amqp)://[^/\s:@]+:[^/\s:@]+@
generic-assignment:(api[_-]?key|secret|token|passw(or)?d)["'"'"']?\s*[:=]\s*["'"'"'][^"'"'"'$\{ ]{12,}["'"'"']'
n=0
while IFS=: read -r name re; do
  [ -z "$name" ] && continue
  while IFS=: read -r f l _; do
    case "$f" in *.lock|*lock.json|*.example|*.sample|*.min.js) continue;; esac
    say BLOCKER security "possible $name at $f:$l"; n=$((n+1))
  done < <(git grep -InEi -e "$re" -- . ':!*lock*' 2>/dev/null | head -50)
done <<< "$patterns"
[ "$n" -eq 0 ] && say OK security "no secret patterns in tracked files"
if has gitleaks; then
  gitleaks detect --no-banner --redact -q >/dev/null 2>&1 && say OK security "gitleaks (full history) clean" || say BLOCKER security "gitleaks found leaks in history (run: gitleaks detect --redact)"
else say INFO security "gitleaks not installed - history not scanned"; fi

# 2. Code cleanliness -------------------------------------------------------
c=$(git grep -InE '\bdebugger\b|console\.(log|debug)\(|\bdbg!\(|^\s*print\(' -- '*.js' '*.jsx' '*.ts' '*.tsx' '*.py' '*.rs' ':!*test*' ':!*spec*' 2>/dev/null | wc -l)
[ "$c" -gt 0 ] && say WARN cleanliness "$c debug-statement lines (console.log/debugger/print/dbg!) - review, some may be intended output" || say OK cleanliness "no debug statements"
c=$(git grep -InE 'TODO|FIXME|XXX|HACK' -- . ':!*lock*' ':!*.md' 2>/dev/null | wc -l)
[ "$c" -gt 0 ] && say INFO cleanliness "$c TODO/FIXME markers"

# 3. Config & build ---------------------------------------------------------
[ -f package.json ] && ! any package-lock.json pnpm-lock.yaml yarn.lock bun.lockb bun.lock && say WARN build "package.json without a lockfile"
[ -f Cargo.toml ] && [ ! -f Cargo.lock ] && say WARN build "Cargo.toml without Cargo.lock (needed for binaries)"
[ -f pyproject.toml -o -f requirements.txt ] && ! any uv.lock poetry.lock Pipfile.lock requirements*.txt && say WARN build "Python project without lock/pinned requirements"
[ -f package.json ] && grep -qE '"[^"]+": *"(\*|latest)"' package.json && say WARN build "package.json uses * or latest versions"

# 4. Docs -------------------------------------------------------------------
[ -f README.md ] || say BLOCKER docs "README.md missing"
[ -f README.md ] && [ "$(wc -l < README.md)" -lt 10 ] && say WARN docs "README.md is very short ($(wc -l < README.md) lines)"
any LICENSE LICENSE.md LICENSE.txt COPYING && say OK docs "LICENSE present" || say WARN docs "no LICENSE (required if open source)"
[ -f CONTRIBUTING.md ] || say INFO docs "no CONTRIBUTING.md (only needed if accepting contributions)"

# 5. Git --------------------------------------------------------------------
t=$(git ls-files | grep -E '(^|/)(node_modules|dist|build|target|\.idea|\.vscode|__pycache__)/|\.DS_Store$')
[ -n "$t" ] && say BLOCKER git "ignorable files are tracked (git rm --cached): $(echo "$t" | head -5 | tr '\n' ' ')"
[ -f .gitignore ] || say BLOCKER git ".gitignore missing"
b=$(git symbolic-ref --short HEAD 2>/dev/null); case "$b" in main|master) say OK git "branch: $b";; *) say WARN git "current branch is '$b', not main/master";; esac
stale=$(git branch --merged | grep -vE '^\*|main|master' | wc -l); [ "$stale" -gt 0 ] && say INFO git "$stale merged local branches can be deleted"
bad=$(git log --format=%s | grep -ciE '^(fix|wip|asd+f*|test|update|\.+|a+|x+)$'); total=$(git rev-list --count HEAD 2>/dev/null)
[ "$bad" -gt 0 ] && say WARN git "$bad of $total commit messages are meaningless (fix/wip/asdf...)"
conv=$(git log --format=%s | grep -cE '^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\([^)]+\))?!?: '); say INFO git "$conv of $total commits follow Conventional Commits"
say INFO git "author identity: $(git config user.name) <$(git config user.email)> (check you want this public)"

# 6. Package metadata -------------------------------------------------------
if [ -f package.json ] && has node; then
  node -e 'const p=require("./package.json");const m=["name","version","description","license","repository","keywords","author"].filter(k=>!p[k]);if(!p.private&&m.length)console.log("WARN|package|package.json missing: "+m.join(", "))'
fi
exit 0
