# skills

A collection of agent skills that work with any coding agent supported by the [`skills`](https://www.npmjs.com/package/skills) CLI.

| Skill | What it does |
|---|---|
| [`app-launch-checklist`](skills/app-launch-checklist) | Pre-launch legal, privacy, accessibility and trust review (35 items). |
| [`pre-release-checklist`](skills/pre-release-checklist) | Technical pre-release check: secrets, debug leftovers, lint, deps, build, docs, git hygiene, package metadata. Includes a read-only `scan.sh`. |

## Install

```bash
npx skills add awaiden/skills
```

Pick the skills and agents you want when prompted. To install one skill only: `npx skills add awaiden/skills --skill pre-release-checklist`.

## Use

Skills are picked up by your agent from their descriptions, e.g. ask "is this repo ready to push to GitHub?".

The scanner also works standalone:

```bash
bash skills/pre-release-checklist/scripts/scan.sh <repo>   # prints LEVEL|group|message lines
```

## License

[MIT](LICENSE)
