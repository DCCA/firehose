# Tasks: Refresh Firehose for modern AI agents

## Checklist

- [x] 1. README: rewrite the "Problem" section to name 2026 problems (volume of
        plausible code, confidently-wrong unverified output, multi-agent
        coordination); keep the "Solution" table but align it to these.
- [x] 2. README: add a short "Working with multiple agents" subsection (spec
        ownership, one change folder per agent, avoiding collisions).
- [x] 3. README: reframe the Build/Verify summary so Firehose *complements* the
        harness (owns Scope + artifacts) instead of restating TDD.
- [x] 4. README: update Quick Start / adoption to lead with skill +
        `AGENTS.md`/`CLAUDE.md` snippet; keep curl as fallback.
- [x] 5. FIREHOSE.md: add a "Multi-agent collaboration" subsection.
- [x] 6. FIREHOSE.md: make Loop 3 (Verify) explicitly independent/adversarial
        (a fresh perspective tries to refute, not the author re-reading).
- [x] 7. FIREHOSE.md: reframe "OpenSpec-lite" as a deliberate
        minimum-viable / tool-agnostic / brownfield-first positioning.
- [x] 8. Verify pass: re-read proposal vs. diff, check internal consistency
        between README and FIREHOSE, no broken links/anchors.
        (Independent agent review caught a deleted Loop 3 heading; fixed. Also
        fixed pre-existing PRD.md omission in README structure diagram.)
- [x] 9. Write completion.md; move folder to .docs/done/; final commit + push.

<!-- Each task is one small, reviewable commit. Split if any grows too large. -->
