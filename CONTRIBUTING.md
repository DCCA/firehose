# Contributing to Firehose

Thanks for your interest in improving Firehose! This project *is* a workflow for
building with AI agents, so we ask contributors to use that same workflow when
proposing changes. It keeps the repo aligned with its own principles.

## Ways to contribute

- **Improve the docs** — clarify the method, fix errors, add examples.
- **Refine the templates** — make `.docs/templates/` more useful.
- **Share experience** — open a discussion or issue about what worked (or didn't).
- **Report problems** — broken links, confusing wording, or gaps.

## The workflow (dogfood Firehose)

Firehose moves every change through three short loops: **Scope → Build → Verify**.
See [FIREHOSE.md](FIREHOSE.md) for the full rules. In short:

1. **Scope.** Open an issue (or a draft proposal) describing *why* the change is
   needed and *what* it touches. For non-trivial changes, create a change folder
   under `.docs/doing/<change-name>/` with a `proposal.md` and `tasks.md` copied
   from `.docs/templates/`.
2. **Build.** Make the smallest change that satisfies the scope. Keep diffs
   focused and reviewable — one logical unit of work per pull request.
3. **Verify.** Re-read the proposal, check the diff for scope creep, and — ideally
   — have a fresh perspective review it. Write a `completion.md` for substantial
   changes and move the folder to `.docs/done/`.

## Pull requests

- Branch from `main` and open a PR against `main`.
- Use a clear, descriptive title (Conventional Commits style is welcome, e.g.
  `docs: clarify the Verify loop`).
- Fill in the PR template.
- Keep the PR scoped to one change. If it grows, split it.
- Every PR is reviewed before merge.

## Style

- Write for both humans and LLMs: short sections, explicit headings.
- Plain, direct language. Avoid prompt theater and over-engineering.
- Match the tone and structure of the surrounding docs.

## Code of Conduct

By participating, you agree to abide by our
[Code of Conduct](CODE_OF_CONDUCT.md).

## License

By contributing, you agree that your contributions will be licensed under the
[MIT License](LICENSE) that covers this project.
