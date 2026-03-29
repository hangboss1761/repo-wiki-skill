---
name: repo-wiki
description: Use this skill when project documentation needs to be created, updated, or queried in this repository. It turns code facts into navigable, traceable, and maintainable project docs, and keeps docs synced after architecture changes.
---

# repo-wiki

## Output Language

- Default: match the user's query language
- If the user explicitly requests a different output language, follow that explicit instruction for the task

## Intent

Build a continuous flow of "code facts -> project docs -> reusable team knowledge" instead of one-off documentation.

Positioning: like DeepWiki, but agent-maintained in-repo docs.

`wiki/_sidebar.md` is the TOC—read it first to scan the doc set.

## Wiki path (MUST)

- Write all docs under **`wiki/`** that sits **next to this `SKILL.md`** (same directory as `scripts/`).
- **MUST NOT** choose the path from the repo or workspace folder name; **MUST** resolve from this file’s location in the tree.

## Trigger Conditions

Trigger this skill when any of the following is true:

- Create or initialize project docs, architecture overviews, or a knowledge base
- Update module docs, refresh pages, or add call-chain explanations
- Explain implementation details with code-backed evidence
- Current task changes routes, state, dependencies, or cross-module calls and docs must stay in sync

Do not trigger for:

- Pure style/copy/comment-only changes with no architecture knowledge impact
- Temporary verbal answers when the user explicitly does not want documentation updates

## Required Outputs

1. Update docs under this skill’s `wiki/` (per **Wiki path**)
2. Include a brief change report in the response:

```markdown
## Project Documentation Changes
- Scope:
- Change type: Content change / Structure change
- Files touched:
- Updated `wiki/_sidebar.md`: Yes / No
- Sources：
```

## Minimum Page Structure (Required for Every Page)

- `Purpose & Scope`: define what the page covers and does not cover (2-6 lines)
- `Sources`: list code evidence at the end of the page in `path (line-range)` format

## Global Hard Rules (Must Pass)

1. Obey **Wiki path**
2. Every page must be reachable from `wiki/_sidebar.md`
3. Architecture/flow pages must include at least one Mermaid diagram
4. Inter-page links must use relative paths
5. Never guess when evidence is insufficient; read code first, then write conclusions

## Execution Flow (Compact)

### 1) Initialize Project Docs (Full)

1. Read entry points and configs (for example `package.json`, build/start scripts)
2. Identify core directories and key flows; select 3-10 evidence files
3. Create minimum structure: `wiki/README.md`, `wiki/_sidebar.md`, and key module pages
4. Add Mermaid diagrams and `Sources`

### 2) Incremental Updates

1. Classify first: content change or structure change
2. Update only affected pages; update Mermaid when flow changes
3. Update `Sources`
4. If structure changes, update `wiki/_sidebar.md` in the same task

### 3) Q&A and Knowledge Capture

1. Read existing project docs, then verify with latest code
2. If no page exists, create a minimal page before answering
3. Prefer answer structure: conclusion + code path + cautions

### 4) Architecture-Change Sync

When tasks affect routes/state/dependencies/cross-module calls, check whether docs are outdated before finishing. If outdated, update them and list updated pages in the response.

## Acceptance Checklist (All Required)

- Pages are reachable from `wiki/_sidebar.md` (no orphan pages)
- Architecture/flow pages include Mermaid diagrams
- Every page has `Purpose & Scope` and trailing `Sources`
- `Sources` are traceable to code and consistent with conclusions
- Response includes scope, change type, navigation change status, and touched files

## Local Preview

`bash <path-to-this-skill>/scripts/serve-wiki.sh` — the script resolves `wiki/` beside itself, not from cwd. Optional `package.json`: same command as `"wiki"`, then `pnpm run wiki`.

