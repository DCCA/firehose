# 🔥 Firehose

**Build better software with AI agents—no more drift between plan and code.**

Firehose is a lightweight, spec-driven workflow that keeps AI coding agents aligned with your intent. It treats project documentation as a first-class source of truth, ensuring every change is traceable, reviewable, and reversible.

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

Use this when you want to adopt **the Firehose method in another repo**.

```bash
# 1) Add Firehose principles to your repo
curl -fsSL https://raw.githubusercontent.com/DCCA/firehose/main/FIREHOSE.md -o FIREHOSE.md

# 2) Copy the templates into your project
mkdir -p .docs/templates .docs/todo .docs/doing .docs/done
curl -fsSL https://raw.githubusercontent.com/DCCA/firehose/main/.docs/templates/{proposal,spec,design,tasks,completion,PRD}.md \
  -o ".docs/templates/#1.md"

# 3) Tell your AI agent to read the rules
# Prompt: "Read FIREHOSE.md before making any changes."
```

That's it. Your agent now knows the workflow: **Scope → Build → Verify**.

---

## 🎯 Why Firehose

### The Problem
AI coding agents are powerful, but they often:
- Lose context between sessions
- Make changes that don't align with original intent
- Create code that's hard to review or rollback
- Mix multiple concerns in a single change

### The Solution
Firehose provides structure without bureaucracy:

| Traditional Approach | Firehose Approach |
|---------------------|-------------------|
| 💬 Vague verbal instructions | 📋 Clear, testable requirements |
| 🔄 Lost context between sessions | 📚 Persistent documentation |
| 🌊 Large, mixed-scope changes | 🎯 Small, focused changes |
| ❓ Unclear what changed and why | 📝 Auditable change history |

**Key Benefits:**
- **🔍 Reduce ambiguity** before code is written
- **📦 Keep changes small**, reviewable, and reversible
- **🧠 Preserve intent** across sessions for humans and AI
- **📊 Maintain audit trail** of what changed and why
- **🤝 Enable collaboration** between multiple AI agents or developers

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

**Scope** → Make sure you know what you're building and it fits in one diff.
**Build** → Work through tasks one at a time: test, implement, check, commit.
**Verify** → Confirm the result matches the plan. Write a completion summary. Ship it.

See [FIREHOSE.md](FIREHOSE.md) for the full lifecycle loop details and gate criteria.

## 📁 Project Structure

When you adopt Firehose in a project, you get this structure:

```text
.
├── FIREHOSE.md                  # Rules your AI agent reads before working
└── .docs/
    ├── PRD.md                   # What this project is and isn't
    ├── templates/               # Starting-point docs (copy into change folders)
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
