# 🔥 Firehose

**Build better software with AI agents—no more drift between plan and code.**

Firehose is a lightweight, spec-driven workflow that keeps AI coding agents aligned with product intent. It treats project documentation as a first-class source of truth so every change is scoped, traceable, reviewable, and reversible.

It is designed for product builders, PMs, engineers, and AI agents working together on real repositories where vague prompts are not enough.

## 🧭 What This Is

### 🔥 Firehose (the method)

A workflow you can apply to **any** software repository to keep planning and implementation aligned.

### 📦 This repository

The canonical Firehose docs and reference setup:
- `FIREHOSE.md` (operating principles)
- `README.md` (how to adopt and use Firehose)
- Optional `.docs/` scaffold patterns for real projects

---

## ⚡ Quick Start

**🚀 Fastest path (works for new or existing projects):**

Use this when you want to adopt **the Firehose method in another repo**. The goal is for your agent to load the rules *automatically* — not for you to remember to paste a prompt every session.

1. **Get the files into your repo:**

   ```bash
   curl -fsSL https://raw.githubusercontent.com/DCCA/firehose/main/FIREHOSE.md -o FIREHOSE.md
   mkdir -p .docs/templates .docs/todo .docs/doing .docs/done
   curl -fsSL https://raw.githubusercontent.com/DCCA/firehose/main/.docs/templates/{proposal,spec,design,tasks,completion,PRD}.md \
     -o ".docs/templates/#1.md"
   ```

2. **Make your agent read the rules automatically.** Add a line to the instruction file your agent already auto-loads (`AGENTS.md`, `CLAUDE.md`, or your tool's equivalent):

   ```markdown
   Read FIREHOSE.md and follow it before making any changes.
   ```

3. **(Optional) Save the loops as a reusable command.** If your agent supports slash commands or skills, wrap the Scope / Verify loops as commands (e.g. `/firehose-scope`, `/firehose-verify`) so they're one keystroke away. Firehose is tool-agnostic — use whatever your stack provides.

**Fallback:** no auto-loaded instruction file? Just prompt your agent directly: *"Read FIREHOSE.md before making any changes."*

That's it. Your agent now knows the workflow: **Scope → Build → Verify**.

---

## 🎯 Why Firehose

### The Problem
Modern AI agents are fast and capable — that's exactly the problem. They now:
- **Produce more plausible code than you can review** — the firehose. Output volume outpaces human verification.
- **Sound confident while being wrong** — code that passes its own tests but misses the actual intent.
- **Work in parallel and in the background** — multiple agents (and humans) touching one repo, with no shared source of truth for *what* is being built or *who owns* it.
- **Optimize for the prompt in front of them** — drifting from product intent that was never written down.

The earlier generation of problems — losing context between sessions, hard-to-review diffs — is largely handled by today's harnesses (long context, compaction, native diff review). The bottleneck moved from *generating* code to *trusting* it.

### The Solution
Firehose provides just enough product/process structure to keep fast agents trustworthy:

| Without Firehose | With Firehose |
|---------------------|-------------------|
| 💬 Vague verbal instructions | 📋 Clear, testable requirements |
| 🌊 More code than you can verify | 🎯 Small, scoped, reviewable diffs |
| 🤖 Confident, unchecked output | 🔍 Independent verification against intent |
| 👥 Parallel agents stepping on each other | 📚 Shared specs + one change folder per unit of work |
| ❓ Unclear what changed and why | 📝 Auditable change history |

**Key Benefits:**
- **🔍 Reduce ambiguity** before code is written
- **📦 Keep changes small**, reviewable, and reversible
- **🧠 Preserve intent** across sessions for humans and AI
- **📊 Maintain audit trail** of what changed and why
- **🤝 Enable collaboration** between multiple AI agents or developers
- **✅ Make product decisions inspectable** instead of hidden inside chat history

## 🔁 How It Works

Every change follows three loops. Each one is short — you repeat it until the exit condition is met.

```
  Scope              Build                Verify
  ─────              ─────                ──────
  Clarify intent     Pick a task          Check against spec
  Write proposal     Write test           Run full test suite
  Break into tasks   Implement            Review diff
  User agrees? ──→   Checks pass? ──→     Matches intent? ──→ Done
       ↑  no              ↑  no                ↑  no
       └──────┘           └──────┘             └──→ back to Build
```

**Scope** → Decide what you're building and write it down before any code. *This is the loop your harness can't do for you.*
**Build** → Work through tasks one at a time. Let your agent do what it's good at (write the test, implement, run checks, commit); Firehose just keeps each unit small and tied to a task.
**Verify** → Have a *fresh* perspective check the result against the written intent — not the author re-reading their own work. Then write a completion summary and ship it.

Firehose deliberately doesn't re-teach what modern agents already do well (running tests, reviewing diffs, committing). Its job is the part they *don't* do on their own: pinning down intent up front and verifying against it independently at the end.

See [FIREHOSE.md](FIREHOSE.md) for the full lifecycle loop details and gate criteria.

### Working with multiple agents

Fast agents are often run in parallel — several at once, some in the background, alongside human contributors. Firehose keeps that from turning into chaos:

- **Specs are the shared source of truth.** When agents disagree with each other or with the code, the spec wins. Update the spec deliberately, not as a side effect of a build.
- **One change folder per unit of work.** Each agent (or task) owns its own `.docs/doing/<change-name>/` folder, so parallel work doesn't collide in the same files.
- **Intent lives in the repo, not the chat.** Any agent — or human — can pick up a change folder and know what's being built and why, without replaying someone else's conversation.
- **Verify across boundaries.** Work done by one agent should be verified by another, against the proposal. Independent review is the point.

## 📁 Project Structure

When you adopt Firehose in a project, you get this structure:

```text
.
├── FIREHOSE.md                  # Rules your AI agent reads before working
└── .docs/
    ├── PRD.md                   # What this project is and isn't
    ├── templates/               # Starting-point docs (copy into change folders)
    │   ├── PRD.md
    │   ├── proposal.md
    │   ├── spec.md
    │   ├── design.md
    │   ├── tasks.md
    │   └── completion.md
    ├── todo/                    # Proposed changes (not started)
    ├── doing/                   # Active changes (one folder per change)
    │   └── add-user-search/     # Example change folder
    │       ├── proposal.md
    │       ├── tasks.md
    │       └── spec.md
    └── done/                    # Completed changes with history
```

Each change gets its own folder that moves through `todo/` → `doing/` → `done/`.

## 💡 Philosophy

> "The best process is the one you'll actually follow."

Firehose is the **minimum viable structure** for building with AI agents:

- **Lightweight** — just markdown files and conventions
- **Flexible** — adapt to your project's needs
- **Practical** — based on real experience with AI coding
- **Open** — not tied to any specific tool or platform

---

## 📚 Learn More

- **[FIREHOSE.md](FIREHOSE.md)** - Detailed operating principles
- **[CHANGELOG.md](CHANGELOG.md)** - What's changed and why
- **Examples** - Coming soon
- **Discussions** - Share your experience with Firehose

---

## 📝 License

[MIT License](LICENSE) - Free to use, modify, and distribute.

This project is open source and available to everyone. See the LICENSE file for full details.

---

<div align="center">
**Built with ❤️ for the AI-augmented software development era**
[⭐ Star this repo](https://github.com/DCCA/firehose)
</div>
