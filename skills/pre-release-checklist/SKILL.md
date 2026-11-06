---
name: pre-release-checklist
description: Run a technical pre-release check on a project, website or package before it is pushed to GitHub, made public, deployed or published — secrets and .env hygiene, hardcoded credentials, leftover debug code, dead code, lint/format, dependencies and lockfiles, build and tests, README/LICENSE/CONTRIBUTING, .gitignore, commit history, default branch, and package metadata. Make sure to use this skill whenever the user says they are about to push, publish, open-source, release, ship or go live, asks "is this ready for GitHub?", "what should I check before deploying?", or wants a repo cleaned up before sharing, even if they never say "checklist". Also trigger on Turkish phrasing such as "yayın öncesi kontrol", "GitHub'a atmadan önce", "canlıya almadan önce". For legal/privacy/accessibility review use app-launch-checklist instead.
---

# Pre-Release Checklist

Check a project against six groups of release hygiene, report what you found, and fix the safe things on request. Reply in the user's language.

Run the checks yourself against the real repo instead of handing the user a list to tick. A checklist that nobody ran gives false comfort; the value is in the findings.

## How to work

1. **Run the scanner first.** `bash <skill-dir>/scripts/scan.sh <repo>` is read-only and does the deterministic checks in seconds (tracked `.env`, secret patterns, debug leftovers, lockfiles, LICENSE/README, tracked build artifacts, branch, commit-message quality, manifest metadata). Each line is `LEVEL|group|message` with levels BLOCKER > WARN > INFO > OK. It never prints secret values. Its patterns are a first pass: confirm each BLOCKER by reading the line, since test fixtures and docs produce false positives, and a clean scan is not proof of no secrets.
2. **Detect the stack** (package.json, Cargo.toml, pyproject.toml, go.mod…) and whether this is a library/package, an app, or a site. Read `references/stacks.md` for that stack's lint/audit/build commands. Items marked *(package only)* or *(open source only)* are skipped otherwise; say so.
3. **Do the judgment checks the script can't:** the sections below. Run the project's real lint, build and test commands, and report real output. If you couldn't run something, say that instead of ticking it.
4. **Report** by group with ✅ / ⚠️ / ❌ / ➖, a file:line per finding, blockers first. Never print a secret value, only where it is and what kind.
5. **Fix only on request**, using `references/fixes.md`. Auditing is read-only; fixes change files, and history rewriting is destructive, so each gets the user's go-ahead.

### Modes

- **Full audit** (default): everything above.
- **Quick scan**: "just check for secrets" or "is it safe to push?" - run the script, answer from BLOCKERs only.
- **Fix mode**: after the report, apply the safe fixes (ignore rules, `.env.example`, untrack artifacts, README/LICENSE skeleton) as separate small commits using Conventional Commits.
- **CI/gate**: if the user wants it automated, suggest a pre-push hook or CI step running `scan.sh` and failing on any `BLOCKER|` line (`! scan.sh | grep -q '^BLOCKER|'`), plus gitleaks.

## 1. Security

- **Secrets stay out of git.** `git ls-files | grep -E '(^|/)\.env'` should only list `.env.example`. Confirm `.env*` is in `.gitignore`.
- **`.env.example` exists** with every variable the code reads and empty values. Compare against the code: grep `process.env.`, `os.environ`, `std::env::var`, `import.meta.env` and flag variables missing from the example.
- **Hardcoded sensitive data.** The script covers common token formats; also read for test passwords, internal endpoints and credentials in DB URIs, and for secrets exposed to browsers via `VITE_*`/`NEXT_PUBLIC_*`/`REACT_APP_*` variables. `gitleaks detect` or `trufflehog` are stronger if installed.
- **Check history, not just HEAD.** A secret deleted in a later commit is still public once pushed: `git log -p --all -S<pattern>` or run gitleaks over history. If one is found, the answer is *rotate the credential*; rewriting history comes second.

## 2. Code quality & cleanliness

- **Debug leftovers:** `console.log`, `debugger`, `print(`, `dbg!`, `println!` used for debugging, `TODO/FIXME/XXX`, temporary test functions. Judge each hit: a CLI's intended output or a real logger is not debug code.
- **Dead code:** unused imports/exports (ESLint `no-unused-vars`, `knip`, `ruff --select F401`, `cargo clippy`), large commented-out blocks, unreferenced files and static assets.
- **Lint & format:** run the project's own tools (Prettier, ESLint, Rustfmt/clippy, Black/Ruff). If none is configured, suggest one rather than imposing it.

## 3. Configuration & build

- **Dependencies:** remove unused ones (`depcheck`, `knip`, `cargo machete`, `pip-check`/`deptry`), pin or sensibly range versions, and commit the lockfile (`package-lock.json`/`pnpm-lock.yaml`/`yarn.lock`, `Cargo.lock` for binaries, `uv.lock`/`poetry.lock`). Run the ecosystem's audit (`npm audit`, `cargo audit`, `pip-audit`) and report high/critical issues.
- **Build and tests from a clean state:** run the real commands (`npm run build`, `cargo build --release`, test suite). Report actual output; if you could not run them, say that rather than ticking the box.

## 4. Documentation

- **README.md** covers: purpose, screenshot/demo (for UI projects), requirements, install steps, usage examples. Verify the install steps work: a README with stale commands is worse than a short one.
- **LICENSE** at the root *(open source only)*. If missing, ask which license the owner wants (MIT, Apache-2.0…); don't pick for them. Check the license matches the one declared in package metadata.
- **CONTRIBUTING.md / CODE_OF_CONDUCT.md** *(only if accepting contributions)*.

## 5. Git & version control

- **`.gitignore`** covers `node_modules/`, `target/`, `dist/`, `build/`, `.DS_Store`, `.vscode/`, `.idea/`, `.env*` (except the example), plus anything stack-specific. Check nothing ignorable is already tracked: `git ls-files | grep -E 'node_modules/|(^|/)(dist|build|target)/|\.DS_Store|\.idea/|\.vscode/'`. Already-tracked files need `git rm --cached`.
- **Commit history:** run `git log --oneline`. Flag meaningless messages ("fix", "asdf", "wip") and note whether Conventional Commits (`feat:`, `fix:`…) is followed. Squashing/rewriting is the user's decision. It is destructive and only safe before the first push or on a branch nobody else uses, so propose it and wait.
- **Branches:** default is `main` (or `master`); list stale local branches with `git branch -vv` and suggest deleting merged ones.

## 6. Package & publish *(package only)*

Double-check name, version, description, keywords, author, license, repository/homepage URLs, and entry points/`files` list in package.json, Cargo.toml or pyproject.toml. Do a dry run (`npm pack --dry-run`, `cargo package --list`, `python -m build`) to see exactly what would be published — this is where stray `.env` files and test fixtures leak.

## Final summary

End with: blockers (must fix before release), recommended fixes, and what you skipped or couldn't verify. If everything is clean, say so plainly in one line.
