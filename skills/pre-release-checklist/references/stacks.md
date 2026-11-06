# Stack-specific commands

Use the project's own configured tools first; these are fallbacks. Read only the section for the detected stack.

## Node / TypeScript
- Unused deps/exports/files: `npx knip` (or `npx depcheck`)
- Lint/format: `npx eslint .`, `npx prettier --check .`, `npx tsc --noEmit`
- Audit: `npm audit --omit=dev --audit-level=high`
- Publish preview: `npm pack --dry-run` (check `files` field / `.npmignore`)
- Reproducible install check: `npm ci && npm run build && npm test`
- Frontend leak check: any secret in a `VITE_*`, `NEXT_PUBLIC_*`, `REACT_APP_*` variable ships to browsers. Flag these.

## Rust
- `cargo fmt --check`, `cargo clippy --all-targets -- -D warnings`
- Unused deps: `cargo machete`; audit: `cargo audit`
- `cargo build --release && cargo test`; publish preview: `cargo package --list`
- Commit `Cargo.lock` for binaries; libraries may omit it.

## Python
- `ruff check .` + `ruff format --check .` (or `black --check .`), `mypy` if configured
- Unused deps: `deptry .`; audit: `pip-audit`
- `python -m build && twine check dist/*` for packages
- Watch for `print(`, `breakpoint()`, `pdb`, and `DEBUG = True` in settings.

## Go
- `gofmt -l .`, `go vet ./...`, `go mod tidy` (should produce no diff), `govulncheck ./...`, `go test ./...`

## Web frameworks (Next/Django/Rails/Laravel)
- Debug flags off for production: `DEBUG=False`, `APP_DEBUG=false`, `NODE_ENV=production`.
- Default/dev secrets replaced (`SECRET_KEY`, `APP_KEY`), `ALLOWED_HOSTS`/CORS not `*`.
- Source maps, `/admin`, `/docs`, seed/test accounts not exposed unintentionally.
