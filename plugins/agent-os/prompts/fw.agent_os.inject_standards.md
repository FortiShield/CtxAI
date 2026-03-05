# Inject Standards

Inject relevant standards into the current context, formatted appropriately for the situation.

## Usage Modes

### Auto-Suggest Mode (no arguments)
Analyzes context and suggests relevant standards.

### Explicit Mode (with arguments)
Directly injects specified standards without suggestions. Arguments can be:
- **Folder name** -- `api` injects all `.md` files in `agent-os/standards/api/`
- **Folder/file** -- `api/response-format` injects `agent-os/standards/api/response-format.md`
- **Root folder** -- `root` injects all `.md` files directly in `agent-os/standards/` (not in subfolders)
- **Root file** -- `root/naming` injects `agent-os/standards/naming.md`
- Multiple arguments inject multiple standards

## Process

### Step 1: Detect Context Scenario

Determine which scenario applies:

1. **Conversation** -- Regular chat, implementing code, answering questions
2. **Creating a Skill** -- Building a reusable procedure or skill file
3. **Shaping/Planning** -- Building a spec, planning significant work

If the scenario is not clearly one of these, ask the user to confirm.

### Step 2: Read the Index (Auto-Suggest Mode)

Read `agent-os/standards/index.yml` to get the list of available standards and their descriptions.

If index.yml does not exist or is empty, advise the user to run discover-standards first, or index-standards if they have standards files without an index.

### Step 3: Analyze Work Context

Look at the current conversation to understand:
- What type of work? (API, database, UI, etc.)
- What technologies mentioned?
- What is the goal?

### Step 4: Match and Suggest

Match index descriptions against the context. Present 2-5 relevant standards and ask the user to confirm.

### Step 5: Inject Based on Scenario

#### Scenario: Conversation
Read the standards and present them directly with the full content of each standard file, followed by a summary of key points.

#### Scenario: Creating a Skill
Ask whether to include standards as file references or full content copy:
- **References** -- Add file paths that point to the standards (lightweight, stays in sync)
- **Copy content** -- Paste the full standards content (self-contained, does not update if standards change)

#### Scenario: Shaping/Planning
Same choice as Creating a Skill -- references or full content copy.

### Step 6: Surface Related Skills (Conversation scenario only)

When in conversation scenario, check if related skills exist and surface them for awareness. Do not invoke skills automatically.

## Explicit Mode

When arguments are provided, skip the suggestion step but still detect scenario.

1. Parse arguments (folder names, folder/file paths, or root keyword)
2. Validate that specified files/folders exist
3. If not found, show available standards and suggest alternatives
4. Inject based on detected scenario

## Tips

- **Run early** -- Inject standards at the start of a task, before implementation
- **Be specific** -- If you know which standards apply, use explicit mode
- **Check the index** -- If suggestions seem wrong, rebuild the index
- **Keep standards concise** -- Injected standards consume tokens; shorter is better

## Integration

This command is called internally by shape-spec to inject relevant standards during planning. You can also invoke it directly anytime you need standards in context.
