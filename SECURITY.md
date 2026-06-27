# Security Policy

Firehose is a documentation-and-templates project — it ships no executable code,
so its security surface is small. Still, we take reports seriously.

## Reporting a concern

If you find something that could put users at risk — for example a malicious
link, a harmful command in an example snippet, or a supply-chain concern in the
suggested `curl` commands — please report it privately rather than opening a
public issue.

- Preferred: open a private vulnerability report via GitHub
  (**Security → Report a vulnerability**) if enabled on this repository.
- Otherwise: contact the maintainers at
  **[INSERT CONTACT METHOD — e.g. a maintainer email]**.

Please include enough detail to reproduce or understand the issue. We aim to
acknowledge reports within a few days.

## Scope

In-scope examples:
- Instructions or snippets in this repo that, if followed, could harm a user's
  machine or repository.
- Links pointing to unexpected or unsafe destinations.

Out of scope:
- Vulnerabilities in third-party tools you choose to use *alongside* Firehose
  (report those to the respective projects).
