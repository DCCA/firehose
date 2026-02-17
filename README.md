# Firehose

A lightweight, spec-driven workflow for building software with AI coding agents.

Firehose keeps planning and implementation aligned by treating project docs as first-class source of truth.

## Why Firehose

- Reduce ambiguity before code is written.
- Keep changes small, reviewable, and reversible.
- Preserve intent across sessions for humans and AI agents.
- Maintain an auditable history of what changed and why.

## Core Approach

Firehose follows an OpenSpec-lite model:

- **Fluid, not rigid**: update docs as understanding evolves.
- **Iterative, not waterfall**: refine while implementing.
- **Brownfield-first**: describe deltas to existing behavior.
- **One logical unit per change**: avoid mixed-scope work.

## Project Structure

```text
.
├── README.md
├── FIREHOSE.md                  # Operating principles and rules
└── .docs/                       # Source-of-truth documentation
    ├── PRD.md                   # Product goals, constraints, non-goals
    ├── todo/                    # Proposed changes (not started)
    ├── doing/                   # Active changes
    └── done/                    # Completed changes with context/history
```

> `.docs/` should be committed to git. Ignore only ephemeral paths like `.docs/tmp/` or `.docs/.cache/`.

## Change Lifecycle

For each non-trivial change, create one folder under `.docs/doing/<change-name>/`:

```text
proposal.md   # why + scope
spec.md       # requirements + scenarios (what)
design.md     # technical approach (how)
tasks.md      # implementation checklist
```

### 1) Proposal (`proposal.md`)

Define:

- Intent (problem/opportunity)
- In-scope
- Out-of-scope
- Constraints and risks

### 2) Spec (`spec.md`)

Write requirements using RFC 2119 language (`MUST`, `SHALL`, `SHOULD`, `MAY`) with testable scenarios:

```markdown
### Requirement: Descriptive Name
The system SHALL ...

#### Scenario: Example
- GIVEN ...
- WHEN ...
- THEN ...
- AND ...
```

### 3) Design (`design.md`)

Capture key technical decisions, architecture notes, and trade-offs.

### 4) Tasks (`tasks.md`)

Break implementation into small, numbered checklist items:

- [ ] 1.1 ...
- [ ] 1.2 ...
- [ ] 2.1 ...

## Definition of Done

Before moving a change from `.docs/doing/` to `.docs/done/`:

- All tasks are complete or explicitly deferred.
- Code matches requirements and scenarios.
- Relevant tests pass (except explicitly agreed pure UI tweaks).
- Design notes reflect final decisions.
- Completion summary is recorded (what changed, risks, follow-ups).

## Working with AI Agents

- Read and follow `FIREHOSE.md` before making edits.
- Keep responses plain and direct.
- If impact is unclear, present 2-3 options first.
- Work in tight loops: discuss → implement → test → refine.
- Prefer minimal blast radius and reversible diffs.

## Contributing

1. Open or create a change in `.docs/doing/`.
2. Keep artifacts and implementation in sync.
3. Submit focused PRs with clear scope.
4. Include tests when behavior changes.

## Status

This repository currently defines the process and governance baseline. Implementation-specific modules can be added incrementally under the same workflow.
