# skills

A collection of [Claude Code](https://claude.com/claude-code) skills.

| Skill | What it does |
|---|---|
| [`app-launch-checklist`](skills/app-launch-checklist) | Pre-launch legal, privacy, accessibility and trust review (35 items). |
| [`pre-release-checklist`](skills/pre-release-checklist) | Technical pre-release check: secrets, debug leftovers, lint, deps, build, docs, git hygiene, package metadata. Includes a read-only `scan.sh`. |

## Install

Copy a skill into your global skills folder (or a project's `.claude/skills/`):

```bash
cp -r skills/pre-release-checklist ~/.claude/skills/
```

## Use

Skills trigger automatically from their descriptions, or invoke one directly, e.g. `/pre-release-checklist`.

The scanner also works standalone:

```bash
bash skills/pre-release-checklist/scripts/scan.sh <repo>   # prints LEVEL|group|message lines
```
