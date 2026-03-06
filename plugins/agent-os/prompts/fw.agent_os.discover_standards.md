# Discover Standards

Extract tribal knowledge from your codebase into concise, documented standards.

## Guidelines

- **Write concise standards** -- Use minimal words. Standards must be scannable by AI agents without bloating context windows.
- **Offer suggestions** -- Present options the user can confirm, choose between, or correct. Do not make them think harder than necessary.

## Process

### Step 1: Determine Focus Area

Check if the user specified an area. If they did, skip to Step 2.

If no area was specified:

1. Analyze the codebase structure (folders, file types, patterns)
2. Identify 3-5 major areas. Examples:
   - **Frontend areas:** UI components, styling/CSS, state management, forms, routing
   - **Backend areas:** API routes, database/models, authentication, background jobs
   - **Cross-cutting:** Error handling, validation, testing, naming conventions, file structure
3. Present the areas to the user and ask which one to focus on.

Wait for user response before proceeding.

### Step 2: Analyze and Present Findings

Once an area is determined:

1. Read key files in that area (5-10 representative files)
2. Look for patterns that are:
   - **Unusual or unconventional** -- Not standard framework/library patterns
   - **Opinionated** -- Specific choices that could have gone differently
   - **Tribal** -- Things a new developer would not know without being told
   - **Consistent** -- Patterns repeated across multiple files
3. Present findings and let the user select which to document.

### Step 3: Ask Why, Then Draft Each Standard

For each selected standard, complete this full loop before moving to the next:

1. **Ask 1-2 clarifying questions** about the "why" behind the pattern
2. **Wait for user response**
3. **Draft the standard** incorporating their answer
4. **Confirm with user** before creating the file
5. **Create the file** if approved

Example questions to ask (adapt based on the specific standard):
- "What problem does this pattern solve? Why not use the default/common approach?"
- "Are there exceptions where this pattern should not be used?"
- "What is the most common mistake a developer or agent makes with this?"

**Do NOT batch all questions upfront.** Process one standard at a time through the full loop.

### Step 4: Create the Standard File

For each standard (after completing Step 3 Q&A):

1. Determine the appropriate folder (create if needed):
   - `api/`, `database/`, `javascript/`, `css/`, `backend/`, `testing/`, `global/`
2. Check if a related standard file already exists -- append to it if so
3. Draft the content and confirm with the user
4. Create or update the file in `agent-os/standards/[folder]/`
5. Then repeat Steps 3-4 for the next selected standard

### Step 5: Update the Index

After all standards are created:

1. Scan `agent-os/standards/` for all `.md` files
2. For each new file without an index entry, propose a description
3. Update `agent-os/standards/index.yml`:

```yaml
api:
  response-format:
    description: API response envelope structure and error format
```

Alphabetize by folder, then by filename.

### Step 6: Offer to Continue

Ask if the user wants to discover standards in another area.

## Output Location

All standards: `agent-os/standards/[folder]/[standard].md`
Index file: `agent-os/standards/index.yml`

## Writing Concise Standards

Standards will be injected into AI context windows. Every word costs tokens. Follow these rules:

- **Lead with the rule** -- State what to do first, explain why second (if needed)
- **Use code examples** -- Show, do not tell
- **Skip the obvious** -- Do not document what the code already makes clear
- **One standard per concept** -- Do not combine unrelated patterns
- **Bullet points over paragraphs** -- Scannable beats readable

**Good example:**
```markdown
# Error Responses

Use error codes: `AUTH_001`, `DB_001`, `VAL_001`

{ "success": false, "error": { "code": "AUTH_001", "message": "..." } }

- Always include both code and message
- Log full error server-side, return safe message to client
```

**Bad example:**
Long paragraphs explaining error handling philosophy in prose form. Standards should be scannable, not essays.

## Full Loop Example

1. Present findings for an area
2. User selects which to document
3. Ask why for first standard
4. User explains the reasoning
5. Draft the standard incorporating their answer
6. User confirms
7. Create the file
8. Move to next standard and repeat

Complete the full ask-draft-confirm-create cycle for each standard before starting the next one.
