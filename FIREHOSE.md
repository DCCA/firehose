# FIREHOSE PRINCIPLES
These are the operating rules for this project.
They are non-negotiable unless the user explicitly approves a change.

## Core Philosophy (OpenSpec-lite)

- Be fluid, not rigid: update plan/spec/tasks as you learn.
- Be iterative, not waterfall: refine intent during implementation.
- Be easy, not complex: choose the simplest process that preserves clarity.
- Be brownfield-first: describe deltas to existing behavior, not full rewrites.
- Keep one logical unit of work per change.

## .docs

- Use `.docs/` for long-lived project context and specs.
- Write for human + LLM readability (short sections, explicit headings).
- If `.docs/` does not exist, create it.
- Do **not** add `.docs/` to `.gitignore`; this folder is part of project source-of-truth.
- If needed, ignore only ephemeral paths (for example `.docs/tmp/`, `.docs/.cache/`, `.docs/drafts/`).

### Structure

- `.docs/PRD.md` → product intent and scope.
- `.docs/templates/` → starting-point documents (copy into change folders).
- `.docs/todo/` → proposed changes not started.
- `.docs/doing/` → active changes.
- `.docs/done/` → completed changes with full history.

For each change, create one folder and copy the templates you need:

```text
.docs/doing/<change-name>/
	proposal.md   # why + scope (always required)
	tasks.md      # checklist (always required)
	spec.md       # requirements + scenarios (for complex changes)
	design.md     # technical approach (fill in during/after build)
	completion.md # summary (fill in when done)
```

## Planning & Spec Rules

- Clarify scope before coding; ask the user when ambiguity affects outcomes.
- Start every non-trivial task with `proposal.md` and `tasks.md`.
- Keep changes focused; if scope/intent shifts significantly, start a new change folder.
- Track tasks with checkboxes and hierarchical numbering (e.g., 1.1, 1.2).
- Keep artifacts synced with reality (do not let docs drift).

### Requirement format (in `spec.md`)

- Write requirements with RFC 2119 keywords (`MUST`, `SHALL`, `SHOULD`, `MAY`).
- Each requirement must include at least one scenario.
- Use Given/When/Then scenarios, including happy path and edge cases.

Template:

```markdown
### Requirement: Descriptive Name
The system SHALL ...

#### Scenario: Example
- GIVEN ...
- WHEN ...
- THEN ...
- AND ...
```

## Code

- Keep code simple, explicit, and easy to review.
- Prefer small diffs with low blast radius and clear rollback paths.
- Follow existing project conventions before introducing new patterns.
- Add concise comments only where intent is non-obvious.
- Use test-driven development when practical.

## Development Lifecycle Loops

Every change moves through three loops. Each loop is short and repeatable — exit when the gate criteria are met, not when time runs out.

Templates for all documents live in `.docs/templates/`. Copy them into your change folder and fill them in.

### Loop 1: Scope (before code)

1. Ask the user what they want to achieve (or read their request carefully).
2. Create a change folder: `.docs/doing/<change-name>/`.
3. Copy `.docs/templates/proposal.md` → fill in Why, Scope, Out of Scope, and Success Criteria.
4. Copy `.docs/templates/tasks.md` → break the work into small, checkable tasks.
5. If requirements are complex, copy `.docs/templates/spec.md` → write testable scenarios.
6. Review with the user: is the scope small enough for one reviewable diff?

**Gate:** proposal.md and tasks.md exist in the change folder, user agrees with scope.

**If scope is too large:** split into multiple change folders. Each one should be independently shippable.

### Loop 2: Build (during code)

For each unchecked task in tasks.md:

1. Write a failing test (when the project has tests).
2. Implement the smallest change that makes it pass.
3. Run the project's checks (tests, linter, type-checker — whatever exists).
4. Check off the task in tasks.md.
5. Commit with a clear message describing what changed.

Repeat until all tasks are checked off.

**Gate:** All tasks complete, all checks pass.

**If a task is bigger than expected:** stop, break it into subtasks in tasks.md (e.g., 3.1, 3.2), then continue.

### Loop 3: Verify (before done)

1. Re-read proposal.md — does the implementation match the original intent?
2. If spec.md exists, walk through each scenario against the actual behavior.
3. Run the full test suite one final time.
4. Review the diff — look for unintended changes, leftover debug code, or scope creep.
5. Update `.docs/templates/design.md` → copy into change folder with final technical decisions.
6. Write `completion.md` in the change folder (what changed, how to verify, risks/follow-ups).
7. Move the change folder from `.docs/doing/` to `.docs/done/`.

**Gate:** All of the following are true:
- Implementation matches proposal and spec.
- All tests pass.
- completion.md is written.
- Change folder is in `.docs/done/`.

**If gaps are found:** return to Loop 2. Do not move to done with known issues.

### When loops stall

If any loop is stuck for more than two iterations without progress:
- Stop and tell the user what is blocking you.
- Present 2–3 concrete options (not open-ended questions).
- Do not continue building on an uncertain foundation.

### Example: what a change folder looks like

A real change folder after completion might look like this:

```text
.docs/done/add-user-search/
    proposal.md        # "Add search-by-email to the users API"
    tasks.md           # 4 tasks, all checked off
    spec.md            # 2 requirements, 5 scenarios
    design.md          # "Added GET /users?email= endpoint, reused existing query builder"
    completion.md      # "Shipped in commit abc123. Risk: no rate limiting yet."
```

## Git

- Follow Git best practices.
- Commit only your own changes.
- Keep `.gitignore` current; create it if missing.
- Keep commits focused and reviewable.

## PRD

- Use `.docs/PRD.md` as the entry point for project context.
- If it does not exist, ask the user to create it.
- Keep goals, constraints, and non-goals current over time.

## AI Collaboration

- Use plain, direct language.
- Avoid prompt theater and over-engineered instructions.
- If impact is unclear, present 2–3 options before changing code.
- Follow the three lifecycle loops (Scope → Build → Verify) for every non-trivial change.
- If work runs long, stop and provide a status update.
- Preserve intent with concise, high-signal notes.