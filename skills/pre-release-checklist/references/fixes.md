# Fix recipes (apply only when the user asks for fixes)

Order matters: secrets first, history rewriting last.

## A secret was committed
1. **Rotate/revoke the credential now.** Assume it is compromised if the repo was ever pushed or shared. This is the real fix.
2. Remove it from code, read it from env, add to `.env`, add `.env*` to `.gitignore`, add the name to `.env.example`.
3. Only if the repo has never been pushed (or the user accepts a force-push): purge history with `git filter-repo --path <file> --invert-paths` (or `--replace-text`). Warn that this changes every commit hash. Never run it without explicit approval.

## Ignorable files already tracked
`git rm -r --cached node_modules dist .DS_Store .idea .vscode` then commit "chore: untrack build artifacts". Verify `.gitignore` first.

## .env.example generation
Create from `.env` keys with values stripped: `sed -E 's/=.*/=/' .env > .env.example` then remove comments with real values. Check the output by eye.

## Messy commit history (not yet pushed / solo branch)
Offer, don't do: `git rebase -i` is unavailable non-interactively here, so propose a squash instead (`git reset --soft <base> && git commit -m "feat: initial release"`) and wait for approval. Back up first: `git branch backup/pre-cleanup`.

## Commit message convention
`type(scope): summary`, types: feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert. Breaking change: `!` after type.

## Missing LICENSE
Ask which license. MIT = permissive, Apache-2.0 = permissive + patent grant, GPL-3.0 = copyleft. Add the file, set `license` in the manifest, fill year and owner name.
