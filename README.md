<div align="center">
<h1>repo-wiki Skill</h1>
English | <a href="./README_CN.md">中文</a>
</div>

## What this skill does

`repo-wiki` helps you keep project documentation continuously synced with code changes.
It turns code facts into navigable project docs under `repo-wiki/wiki/`, instead of one-off notes.

Like **DeepWiki**, but built and maintained by your agent.

## Installation

From your **project** root (the repo you want documented), run:

```bash
npx skills add hangboss1761/repo-wiki-skill
```

This installs the skill **for that project** only. **Global** installation is not recommended.

## When to use

Use this skill when you need to:

- Initialize project docs, architecture pages, or a knowledge base
- Update module docs after implementation changes
- Add code-backed explanations for implementation or call chains
- Keep docs synced when routes, state, dependencies, or cross-module calls change

Do not use it for pure style/copy edits with no architecture impact.

## Core outputs

This skill should always:

1. Update docs under `repo-wiki/wiki/`
2. Ensure every page is reachable from `repo-wiki/wiki/_sidebar.md`
3. Include at least one Mermaid diagram on architecture/flow pages
4. Add `Purpose & Scope` and `Sources` sections on every page
5. Avoid guessing; conclusions must be evidence-backed

## Required response report format

```markdown
## Project Documentation Changes
- Scope:
- Change type: Content change / Structure change
- Files touched:
- Updated `wiki/_sidebar.md`: Yes / No
- Sources:
```

## Local preview

Run:

```bash
bash repo-wiki/scripts/serve-wiki.sh
```

Optional shortcut in `package.json`:

```json
{
  "scripts": {
    "wiki": "bash repo-wiki/scripts/serve-wiki.sh"
  }
}
```

Then run:

```bash
pnpm run wiki
```
