# Agent OS Reference

Agent OS is a standards discovery, extraction, and deployment system for AI-assisted development. It keeps agents aligned with project coding conventions by maintaining a structured set of standards documents.

## Core Concepts

### Standards
Standards are concise documents that capture coding patterns, conventions, and tribal knowledge from a codebase. They are stored in `agent-os/standards/[folder]/[standard].md` and indexed in `agent-os/standards/index.yml`.

Standards should be:
- **Concise** -- Every word costs tokens when injected into context
- **Scannable** -- Bullet points over paragraphs
- **Example-driven** -- Show, do not tell
- **Single-concept** -- One standard per pattern

### Standards Index
The file `agent-os/standards/index.yml` maps each standard to a one-line description for quick matching. Format:

```yaml
folder-name:
  file-name:
    description: Brief description here
```

Alphabetized by folder, then by filename.

### Product Documentation
Product-level context is stored in `agent-os/product/`:
- `mission.md` -- Problem, target users, solution
- `roadmap.md` -- MVP and post-launch features
- `tech-stack.md` -- Frontend, backend, database, and other tools

### Specs
Feature specifications are stored in `agent-os/specs/` using timestamped folders:
```
agent-os/specs/YYYY-MM-DD-HHMM-feature-slug/
  plan.md
  shape.md
  standards.md
  references.md
  visuals/
```

## Available Commands

### discover-standards
Extract tribal knowledge from the codebase into documented standards. Analyzes code patterns, asks clarifying questions, and produces concise standard files.

### inject-standards
Inject relevant standards into the current context. Supports auto-suggest mode (analyzes context) and explicit mode (specify standards by path). Adapts output format based on whether you are in conversation, creating a skill, or shaping a plan.

### index-standards
Rebuild the standards index file. Scans for new files, removes stale entries, and maintains alphabetical order.

### plan-product
Establish foundational product documentation (mission, roadmap, tech stack) through interactive conversation.

### shape-spec
Structure planning for significant work. Gathers context, surfaces relevant standards, identifies reference implementations, and produces a spec folder with all planning artifacts.

## Directory Structure

```
agent-os/
  standards/
    index.yml
    api/
      response-format.md
      error-handling.md
    database/
      migrations.md
    global/
      tech-stack.md
      naming.md
  product/
    mission.md
    roadmap.md
    tech-stack.md
  specs/
    2026-01-15-1430-user-comment-system/
      plan.md
      shape.md
      standards.md
      references.md
      visuals/
```

## Configuration

Agent OS uses a profile-based configuration system:

```yaml
version: 3.0
default_profile: default
```

Profiles can inherit from other profiles and contain global standards (like tech-stack) that apply across all areas.

## Writing Good Standards

1. **Lead with the rule** -- State what to do first, explain why second
2. **Use code examples** -- A code block is worth a thousand words
3. **Skip the obvious** -- Do not document what the code makes clear
4. **One standard per concept** -- Keep them focused
5. **Bullet points over paragraphs** -- Scannable beats readable
6. **Keep descriptions short** -- Index descriptions are one sentence
