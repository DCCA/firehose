# Proposal: Make the repo share-worthy (open-source best practices)

## Why

Firehose is being shared publicly. It has a README, LICENSE, and CHANGELOG, but
is missing the standard community health files that signal a well-run,
contributor-friendly open-source project. Adding them makes the repo
approachable and lowers the barrier to good contributions.

## Scope

Add the conventional GitHub community health and hygiene files, tailored to a
docs/methodology repo (no application code):

- `CONTRIBUTING.md` — how to contribute, dogfooding the Firehose workflow.
- `CODE_OF_CONDUCT.md` — Contributor Covenant 2.1.
- `SECURITY.md` — how to report concerns (kept lightweight; this is a docs repo).
- `.gitignore` — ignore OS/editor cruft and the ephemeral `.docs/` paths
  FIREHOSE.md already calls out (`.docs/tmp/`, `.docs/.cache/`, `.docs/drafts/`).
- `.github/PULL_REQUEST_TEMPLATE.md` — mirrors the Firehose change structure.
- `.github/ISSUE_TEMPLATE/` — bug report, proposal/feature request, and config.
- README polish: a couple of badges (license, PRs welcome) near the title.

## Out of Scope

- CI/CD pipelines, linters, or test harnesses (no code to test; would violate
  Firehose's "easy, not complex" principle). Can be a follow-up if desired.
- CODEOWNERS (needs a verified GitHub handle/team; leave to the maintainer).
- Rewriting existing docs (README/FIREHOSE/CHANGELOG content stays as-is).
- Publishing any personal contact email without the maintainer's say-so.

## Success Criteria

- GitHub's "community profile" checklist is satisfied (README, LICENSE,
  CONTRIBUTING, CODE_OF_CONDUCT, issue + PR templates).
- CONTRIBUTING reflects the actual Firehose Scope → Build → Verify workflow.
- No personal email is published without an explicit placeholder the maintainer
  can fill.
- All new files are internally consistent and link-valid.
- Lands as a reviewed PR; held at the merge gate.
