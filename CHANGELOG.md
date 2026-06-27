# Changelog

All notable changes to the Firehose method and docs are recorded here.

## Refresh for modern AI agents — 2026-06-27

Updated the Firehose docs (`README.md`, `FIREHOSE.md`) so the method matches
the current state of AI coding agents. Docs and packaging only — no templates,
structure, or tooling changed. Shipped in PR #3.

### Why

Firehose's core thesis got *stronger*, not weaker: agents now generate plausible
code faster than humans can review it — that's the firehose, and guardrails
matter more than ever. But the docs justified that thesis with dated premises
and assumed a single agent working linearly. This refresh fixes the framing and
modernizes how you adopt it.

### Changed

- **Problem reframed for 2026.** The README now leads with today's real
  problems — output volume outpacing review, confident-but-wrong code, and
  parallel/background agents — instead of the largely-solved "loses context
  between sessions." The Solution table was realigned to match.
- **Firehose now complements the harness.** Build and Verify no longer re-teach
  what modern agents already do (write test, run checks, commit). Firehose's
  stated job is the part agents *don't* do on their own: pinning down intent up
  front and verifying against it independently.
- **Verify is now adversarial.** Loop 3 asks a *fresh* perspective — ideally a
  different agent or human — to try to find the gap, rather than the author
  re-reading their own work. The gate now requires an independent check.
- **Multi-agent guidance added** to both files: the spec is the shared source of
  truth, one change folder per unit of work, intent lives in the repo (not the
  chat), and verification crosses agent boundaries.
- **Adoption modernized.** The Quick Start now leads with auto-loaded agent
  instructions (`AGENTS.md` / `CLAUDE.md`) and optional reusable
  commands/skills; `curl` is kept as a fallback. Stayed deliberately
  tool-agnostic — no vendor-specific command shipped in-repo.
- **Positioning sharpened.** "OpenSpec-lite" became a deliberate statement:
  minimum-viable, tool-agnostic, brownfield-first.

### Fixed

- Restored a `### Loop 3: Verify` heading that was dropped during the rewrite
  (caught by the new adversarial Verify step, dogfooded on this very change).
- Added `PRD.md` to the README project-structure diagram — it was already
  fetched by the Quick Start `curl` command but missing from the listing.

### Notes

This change was produced by running Firehose's own Scope → Build → Verify loop
on its own repo. The change folder is archived at
`.docs/done/refresh-for-modern-agents/` (proposal, tasks, completion).
