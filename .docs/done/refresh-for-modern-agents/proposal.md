# Proposal: Refresh Firehose for modern AI agents

## Why

Firehose's core thesis is *more* relevant in 2026 than when it was written:
agents now generate plausible code faster than humans can review it — that is
the firehose, and guardrails (docs as source of truth, small reversible diffs,
captured intent) matter more than ever.

But the docs justify that thesis with dated premises and single-agent mechanics:

- The README "Problem" section leads with problems the harness now largely
  solves (context loss between sessions, hard-to-review changes) instead of
  today's real problems: **volume**, **confidently-wrong unverified output**,
  and **multi-agent coordination**.
- The whole Scope→Build→Verify loop assumes **one agent working linearly**.
  Subagents, parallel fan-out, and background/cloud agents (this very session)
  have no place in the model — nothing about spec ownership or change-folder
  collisions when multiple agents work at once.
- **Build** and **Verify** re-specify what modern harnesses do natively (write
  test, implement, run checks, commit; re-read proposal, run suite). This
  dilutes Firehose's actual contribution: the **Scope** loop and the doc
  artifacts.
- **Verify** is author self-review ("re-read the proposal"). The characteristic
  2026 failure is code that confidently passes its own tests; the fix is
  **independent/adversarial** verification.
- Distribution is **curl + a manual prompt** ("Read FIREHOSE.md before making
  any changes"). The native 2026 unit of reusable workflow is a **skill /
  slash command** plus an auto-loaded agent-instructions file
  (`AGENTS.md` / `CLAUDE.md`).

## Scope

Documentation and packaging only. No product code (this repo is docs).

- `README.md` — rewrite the "Problem" framing for 2026; add a short
  multi-agent subsection; reframe Build/Verify to complement (not restate) the
  harness; update the adoption/Quick Start path to lead with skill +
  agent-instructions file, keep curl as fallback.
- `FIREHOSE.md` — add a "Multi-agent collaboration" subsection (spec ownership,
  change-folder isolation, parallel work); make Loop 3 (Verify) explicitly
  independent/adversarial; soften "OpenSpec-lite" into a deliberate
  minimum-viable / tool-agnostic / brownfield-first positioning.
- Optionally add a thin skill scaffold (e.g. `.docs/` example or a
  `firehose` skill stub) — decide during Build; only if it stays lightweight.

## Out of Scope

- Rewriting the templates in `.docs/templates/` (they are still sound).
- Renaming the method, restructuring the repo, or changing the folder model
  (todo/doing/done stays).
- Building actual tooling/automation, CI, or a published package.
- Endorsing any specific vendor's agent product by name beyond generic
  references (skills, MCP, agent-instructions files).

## Success Criteria

- README "Problem" section names volume, unverified confidence, and
  multi-agent coordination — not solved-in-2024 problems.
- FIREHOSE.md has a multi-agent subsection and an independent/adversarial
  Verify gate.
- Adoption instructions lead with skill + `AGENTS.md`/`CLAUDE.md`, curl kept
  as fallback.
- Build/Verify text positions Firehose as *complementing* the harness, not
  duplicating native behavior.
- Changes land as small, reviewable commits on
  `claude/ai-evolution-review-jxkqal`.
- `completion.md` written and folder moved to `.docs/done/`.
