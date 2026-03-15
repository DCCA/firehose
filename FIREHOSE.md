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

### Suggested structure

- `.docs/PRD.md` → product intent and scope.
- `.docs/todo/` → proposed changes not started.
- `.docs/doing/` → active changes.
- `.docs/done/` → completed changes with full history.

For each change, create one folder:

```text
.docs/doing/<change-name>/
	proposal.md   # why + scope
	spec.md       # requirements + scenarios (what)
	design.md     # technical approach (how)
	tasks.md      # checklist (execution)
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

### Loop 1: Scope (before code)

```
┌─→ Clarify intent with user
│   Write/update proposal.md + tasks.md
│   Check: Is scope small enough for one reviewable diff?
│   Check: Are requirements testable (Given/When/Then)?
└── If no → narrow scope or split into multiple changes
```

**Gate:** proposal.md and tasks.md exist, scope is clear, user agrees.

### Loop 2: Build (during code)

```
┌─→ Pick next unchecked task from tasks.md
│   Write a failing test (when practical)
│   Implement the smallest change that passes
│   Run tests / linter / type-check
│   ✓ Mark task complete in tasks.md
└── If tasks remain → repeat
```

**Gate:** All tasks checked off, tests pass, no lint/type errors.

Keep each iteration small — if a task takes more than a few minutes, break it down further. Commit after each meaningful increment.

### Loop 3: Verify (before done)

```
┌─→ Re-read spec.md scenarios against implementation
│   Run full test suite
│   Review diff for unintended changes
│   Update design.md with final technical decisions
│   Write completion summary (what changed, risks, follow-ups)
└── If gaps found → return to Loop 2
```

**Gate:** All of the following are true:
- Implementation matches requirements and scenarios.
- Relevant tests are added/updated and pass.
- Design notes reflect final decisions.
- Completion summary is written.
- Change folder moves from `.docs/doing/` to `.docs/done/`.

### When loops stall

If any loop is stuck for more than two iterations without progress:
- Stop and surface the blocker to the user.
- Present 2–3 concrete options (not open-ended questions).
- Do not continue building on an uncertain foundation.

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