# Plan Product

Establish foundational product documentation through an interactive conversation. Creates mission, roadmap, and tech stack files in `agent-os/product/`.

## Guidelines

- **Keep it lightweight** -- gather enough to create useful docs without over-documenting
- **One question at a time** -- do not overwhelm with multiple questions

## Process

### Step 1: Check for Existing Product Docs

Check if `agent-os/product/` exists and contains any of these files:
- `mission.md`
- `roadmap.md`
- `tech-stack.md`

If files exist, ask the user whether to start fresh, update specific files, or cancel.

If no files exist, proceed to Step 2.

### Step 2: Gather Product Vision (for mission.md)

Ask the user three questions, one at a time:
1. **What problem does this product solve?** -- The core problem or pain point
2. **Who is this product for?** -- Target users or audience
3. **What makes your solution unique?** -- Key differentiator or approach

### Step 3: Gather Roadmap (for roadmap.md)

Ask two questions, one at a time:
1. **What are the must-have features for launch (MVP)?** -- Core features for the first usable version
2. **What features are planned for after launch?** -- Future phases, or "none yet"

### Step 4: Establish Tech Stack (for tech-stack.md)

First, check if `agent-os/standards/global/tech-stack.md` exists.

If the tech-stack standard exists, summarize it and ask if this project uses the same stack or differs.

If no tech-stack standard exists (or the project differs), ask:
- Frontend (e.g., React, Vue, vanilla JS, or N/A)
- Backend (e.g., Rails, Node, Django, or N/A)
- Database (e.g., PostgreSQL, MongoDB, or N/A)
- Other (hosting, APIs, tools, etc.)

### Step 5: Generate Files

Create the `agent-os/product/` directory if it does not exist.

#### mission.md
```markdown
# Product Mission

## Problem
[What problem this product solves]

## Target Users
[Who this product is for]

## Solution
[What makes the solution unique]
```

#### roadmap.md
```markdown
# Product Roadmap

## Phase 1: MVP
[Must-have features for launch]

## Phase 2: Post-Launch
[Planned future features, or "To be determined"]
```

#### tech-stack.md
```markdown
# Tech Stack

## Frontend
[Frontend technologies, or "N/A"]

## Backend
[Backend technologies, or "N/A"]

## Database
[Database choice, or "N/A"]

## Other
[Other tools, hosting, services]
```

### Step 6: Confirm Completion

Report which files were created and remind the user they can edit them directly or run plan-product again to update.

## Tips

- If the user provides very brief answers, that is fine -- the docs can be expanded later
- If they want to skip a section, create the file with a placeholder like "To be defined"
- The shape-spec command reads these files when planning features, so having them populated helps with context
