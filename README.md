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
# 1) 📜 Add Firehose principles to your repo root
curl -fsSL https://raw.githubusercontent.com/DCCA/firehose/main/FIREHOSE.md -o FIREHOSE.md

# 2) 🤖 Ask your AI agent to scaffold docs + your first change
# Prompt example:
# "Read FIREHOSE.md and create .docs/{todo,doing,done},
# .docs/PRD.md, and .docs/doing/my-first-change/
# with proposal.md, spec.md, design.md, and tasks.md."
```

Then ask your AI agent to read `FIREHOSE.md` before making changes. 🤖

If you're using this repo directly, Step 2 is already done. ✅

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

## 🏗️ Core Approach

Firehose follows an **OpenSpec-lite** model—practical, not prescriptive:

```
📝 Fluid, not rigid       → Update docs as understanding evolves
🔁 Iterative, not waterfall → Refine while implementing
🏭 Brownfield-first       → Describe deltas to existing behavior
🎯 One unit per change    → Avoid mixed-scope work
```

## 📁 Project Structure

This is the **recommended structure inside a project using Firehose**:

```text
.
├── README.md                    # You are here
├── FIREHOSE.md                  # Operating principles and rules
└── .docs/                       # Source-of-truth documentation
    ├── PRD.md                   # Product goals, constraints, non-goals
    ├── todo/                    # 💡 Proposed changes (not started)
    ├── doing/                   # 🚧 Active changes
    └── done/                    # ✅ Completed changes with history
```


## 📊 Repository Status

**Current Phase:** Foundation & Governance

This repository is currently focused on process and governance documentation. Product/application code is expected to live in downstream repos that adopt Firehose.

### Roadmap
- ✅ Core Firehose principles established
- ✅ Documentation structure defined
- 🚧 Example projects and templates (in progress)
- 📋 CLI tools for workflow automation (planned)
- 📋 Integration with popular AI coding tools (planned)

**Legend:** ✅ Complete · 🚧 In Progress · 📋 Planned

---

## 💡 Philosophy

> "The best process is the one you'll actually follow."

Firehose aims to be the **minimum viable structure** for building with AI agents. It's:

- **Lightweight**: Just documentation and conventions
- **Flexible**: Adapt to your project's needs
- **Practical**: Based on real experience with AI coding
- **Open**: Not tied to any specific tool or platform

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

[⭐ Star this repo](https://github.com/DCCA/firehose) · [🐛 Report Bug](https://github.com/DCCA/firehose/issues) · [💡 Request Feature](https://github.com/DCCA/firehose/issues)

</div>
