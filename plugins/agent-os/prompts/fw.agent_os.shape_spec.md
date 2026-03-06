# Shape Spec

Gather context and structure planning for significant work. Use this when starting a substantial feature or change.

## Guidelines

- **Offer suggestions** -- Present options the user can confirm, adjust, or correct
- **Keep it lightweight** -- This is shaping, not exhaustive documentation

## Process

### Step 1: Clarify What We Are Building

Ask the user to describe the feature or change. Based on their response, ask 1-2 clarifying questions if the scope is unclear:
- "Is this a new feature or a change to existing functionality?"
- "What is the expected outcome when this is done?"
- "Are there any constraints or requirements I should know about?"

### Step 2: Gather Visuals

Ask if the user has any visuals to reference:
- Mockups or wireframes
- Screenshots of similar features
- Examples from other apps

If visuals are provided, note them for inclusion in the spec folder.

### Step 3: Identify Reference Implementations

Ask if there is similar code in the codebase to reference:
- "The comments feature is similar to what we are building"
- "Look at how src/features/notifications/ handles real-time updates"
- "No existing references"

If references are provided, read and analyze them to inform the plan.

### Step 4: Check Product Context

Check if `agent-os/product/` exists and contains files.

If it exists, read key files (`mission.md`, `roadmap.md`, `tech-stack.md`) and ask if this feature should align with any specific product goals or constraints.

If no product folder exists, skip this step.

### Step 5: Surface Relevant Standards

Read `agent-os/standards/index.yml` to identify relevant standards based on the feature being built. Present matched standards and ask the user to confirm which to include.

Read the confirmed standards files to include their content in the plan context.

### Step 6: Generate Spec Folder Name

Create a folder name using this format:
```
YYYY-MM-DD-HHMM-{feature-slug}/
```

Where:
- Date/time is current timestamp
- Feature slug is derived from the feature description (lowercase, hyphens, max 40 chars)

If `agent-os/specs/` does not exist, create it when saving the spec folder.

### Step 7: Structure the Plan

Build the plan with **Task 1 always being "Save spec documentation"**.

Present this structure to the user:

- **Task 1: Save Spec Documentation** -- Create `agent-os/specs/{folder-name}/` with:
  - `plan.md` -- The full plan
  - `shape.md` -- Shaping notes (scope, decisions, context)
  - `standards.md` -- Relevant standards that apply to this work
  - `references.md` -- Pointers to reference implementations studied
  - `visuals/` -- Any mockups or screenshots provided
- **Task 2+:** Implementation tasks based on the feature

### Step 8: Complete the Plan

After Task 1 is confirmed, build out remaining implementation tasks based on:
- The feature scope from Step 1
- Patterns from reference implementations (Step 3)
- Constraints from standards (Step 5)

Each task should be specific and actionable.

### Step 9: Ready for Execution

When the full plan is ready, confirm with the user:
1. Task 1 saves all spec documentation first
2. Then implementation tasks proceed

## Output Structure

```
agent-os/specs/{YYYY-MM-DD-HHMM-feature-slug}/
  plan.md           # The full plan
  shape.md          # Shaping decisions and context
  standards.md      # Which standards apply and key points
  references.md     # Pointers to similar code
  visuals/          # Mockups, screenshots (if any)
```

## shape.md Content

```markdown
# {Feature Name} -- Shaping Notes

## Scope
[What we are building]

## Decisions
- [Key decisions made during shaping]
- [Constraints or requirements noted]

## Context
- **Visuals:** [List of visuals provided, or "None"]
- **References:** [Code references studied]
- **Product alignment:** [Notes from product context, or "N/A"]

## Standards Applied
- api/response-format -- [why it applies]
- api/error-handling -- [why it applies]
```

## standards.md Content

Include the full content of each relevant standard, organized with headers.

## references.md Content

```markdown
# References for {Feature Name}

## Similar Implementations

### {Reference 1 name}
- **Location:** `src/features/comments/`
- **Relevance:** [Why this is relevant]
- **Key patterns:** [What to borrow from this]
```

## Tips

- **Keep shaping fast** -- Do not over-document. Capture enough to start, refine as you build.
- **Visuals are optional** -- Not every feature needs mockups.
- **Standards guide, not dictate** -- They inform the plan but are not always mandatory.
- **Specs are discoverable** -- Months later, someone can find this spec and understand what was built and why.
