# Completion: Refresh Firehose for modern AI agents

## What Changed

Updated `README.md` and `FIREHOSE.md` to match the current state of AI coding
agents. No template, structure, or tooling changes.

- **README "Problem"** reframed around 2026 realities: code volume outpacing
  human review, confident-but-wrong output, and parallel/background agents.
  Old "lose context between sessions" framing demoted to "largely handled by
  today's harnesses." Solution table realigned.
- **README "How It Works"** now positions Firehose as *complementing* the
  harness — it owns Scope and independent verification, and stops re-teaching
  TDD. Added a "Working with multiple agents" subsection.
- **README Quick Start** leads with auto-loaded agent instructions
  (`AGENTS.md`/`CLAUDE.md`) and optional reusable commands/skills; `curl` kept
  as fallback. (Tool-agnostic: no specific vendor command shipped in-repo.)
- **README structure diagram** now lists `PRD.md` under templates (it was
  fetched by the curl command but missing from the diagram).
- **FIREHOSE Core Philosophy** reframed from "OpenSpec-lite" to a deliberate
  minimum-viable / tool-agnostic / brownfield-first positioning, plus a
  "don't re-teach the harness" principle.
- **FIREHOSE Loop 3 (Verify)** made independent/adversarial: a fresh
  perspective tries to find the gap rather than the author re-reading. Gate
  updated to require an independent check.
- **FIREHOSE "AI Collaboration"** gained a "Multiple agents" subsection (spec
  as source of truth, one change folder per unit of work, intent in repo not
  chat, cross-agent verification, coordinate through artifacts).

## How to Verify

- `git diff origin/main -- README.md FIREHOSE.md` shows only the changes above.
- README and FIREHOSE agree on: multi-agent guidance, adversarial verify, and
  complement-the-harness framing.
- FIREHOSE still has three loop headings (Scope, Build, Verify); the "see
  Loop 3" reference resolves.
- No "OpenSpec-lite" remains in shipped docs; templates untouched.

## Risks & Follow-ups

- This change dogfooded the new adversarial Verify rule: an independent agent
  reviewed the diff against the proposal and caught a regression (a deleted
  `### Loop 3` heading), which was then fixed before completion. Working as
  intended.
- Packaging is intentionally generic (no in-repo skill file) to preserve
  tool-agnosticism. Follow-up option: ship an optional, clearly-separated
  example command for one popular agent if users ask for a turnkey path.
- The `DCCA/firehose` curl URLs were not re-verified as live (unchanged by
  this diff).
