# 🔥 Firehose

**Build better software with AI agents—no more drift between plan and code.**

Firehose is a lightweight, spec-driven workflow that keeps AI coding agents aligned with your intent. It treats project documentation as a first-class source of truth, ensuring every change is traceable, reviewable, and reversible.

---

## ⚡ Quick Start

**Want to try Firehose?** Choose your path:

- **🆕 New project?** Clone this repo as a template (see [Getting Started](#-getting-started))
- **📦 Existing project?** Add Firehose in 30 seconds:

```bash
# Add Firehose to your existing project
mkdir -p .docs/{todo,doing,done}
curl -o FIREHOSE.md https://raw.githubusercontent.com/DCCA/firehose/main/FIREHOSE.md

# Create your first change
mkdir -p .docs/doing/my-feature && cd .docs/doing/my-feature
echo "## Intent\nSolve X problem..." > proposal.md
echo "## Tasks\n- [ ] 1.1 First task..." > tasks.md

# Point your AI agent to FIREHOSE.md and start building!
```

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

**Important:** `.docs/` should be committed to git. Ignore only ephemeral paths like `.docs/tmp/` or `.docs/.cache/`.

## 🔄 Change Lifecycle

For each non-trivial change, create one folder under `.docs/doing/<change-name>/`:

```text
.docs/doing/add-user-auth/
├── proposal.md   # 🎯 Why + scope
├── spec.md       # 📋 Requirements + scenarios (what)
├── design.md     # 🏗️ Technical approach (how)
└── tasks.md      # ✅ Implementation checklist
```

### 1️⃣ Proposal (`proposal.md`)

**Define the "why":**
- Intent (problem/opportunity)
- In-scope vs out-of-scope
- Constraints and risks

<details>
<summary>📄 Example Proposal</summary>

```markdown
## Intent
Add JWT-based authentication to protect admin endpoints.

## In-Scope
- Login endpoint with email/password
- JWT token generation
- Middleware to verify tokens

## Out-of-Scope
- Password reset flow (separate change)
- OAuth providers (future consideration)

## Constraints
- Must work with existing user database
- Tokens expire after 24 hours
```
</details>

### 2️⃣ Spec (`spec.md`)

**Write testable requirements** using RFC 2119 language (`MUST`, `SHALL`, `SHOULD`, `MAY`):

<details>
<summary>📄 Example Spec</summary>

```markdown
### Requirement: Authentication Endpoint
The system SHALL provide a POST /auth/login endpoint.

#### Scenario: Successful Login
- GIVEN a valid user exists with email "test@example.com"
- WHEN I POST credentials to /auth/login
- THEN I receive a valid JWT token
- AND the token expires in 24 hours

#### Scenario: Invalid Credentials
- GIVEN invalid credentials
- WHEN I POST to /auth/login
- THEN I receive a 401 Unauthorized response
```
</details>

### 3️⃣ Design (`design.md`)

**Capture technical decisions**, architecture notes, and trade-offs.

<details>
<summary>📄 Example Design</summary>

```markdown
## Technical Approach
- Use jsonwebtoken library (already in dependencies)
- Store hashed passwords with bcrypt (existing pattern)
- JWT payload: { userId, email, exp }

## Alternatives Considered
- Session-based auth: Rejected due to stateless requirement
- OAuth only: Deferred to future iteration

## Security Considerations
- Passwords hashed with bcrypt (cost factor 10)
- No sensitive data in JWT payload
- HTTPS required (enforced by middleware)
```
</details>

### 4️⃣ Tasks (`tasks.md`)

**Break implementation into small, numbered items:**

<details>
<summary>✅ Example Tasks</summary>

```markdown
- [x] 1.1 Create auth controller
- [x] 1.2 Add login route
- [ ] 2.1 Implement JWT signing
- [ ] 2.2 Create auth middleware
- [ ] 3.1 Add integration tests
- [ ] 3.2 Update API documentation
```
</details>

## ✅ Definition of Done

Before moving a change from `.docs/doing/` to `.docs/done/`:

- ✅ All tasks are complete or explicitly deferred
- ✅ Code matches requirements and scenarios
- ✅ Relevant tests pass (except pure UI tweaks)
- ✅ Design notes reflect final decisions
- ✅ Completion summary recorded (what changed, risks, follow-ups)

---

## 🤖 Working with AI Agents

Firehose is designed for smooth human-AI collaboration:

**For Humans:**
1. Point your AI agent to `FIREHOSE.md` at the start of each session
2. Create a change folder in `.docs/doing/` for new work
3. Let the AI implement following the documented requirements
4. Review changes against specs for alignment

**For AI Agents:**
- 📖 Read and follow `FIREHOSE.md` before making edits
- 💬 Keep responses plain and direct
- 🤔 If impact is unclear, present 2-3 options first
- 🔁 Work in tight loops: discuss → implement → test → refine
- 🎯 Prefer minimal blast radius and reversible diffs

---

## 🚀 Getting Started

### Option 1: New Project
```bash
# Clone the Firehose template
git clone https://github.com/DCCA/firehose.git my-project
cd my-project

# Set up your project structure
mkdir -p .docs/{todo,doing,done}
echo "# My Project PRD" > .docs/PRD.md

# Start your first change
mkdir -p .docs/doing/initial-setup
```

### Option 2: Existing Project
```bash
# Add Firehose to your existing repository
cd your-project
mkdir -p .docs/{todo,doing,done}

# Download the Firehose principles
curl -o FIREHOSE.md https://raw.githubusercontent.com/DCCA/firehose/main/FIREHOSE.md

# Commit the structure
git add .docs/ FIREHOSE.md
git commit -m "Add Firehose workflow"
```

### Next Steps
1. Create `.docs/PRD.md` with your product goals
2. Add your first change to `.docs/doing/`
3. Follow the Change Lifecycle for implementation

---

## 🤝 Contributing

We welcome contributions! Here's how:

1. **Open or create a change** in `.docs/doing/`
2. **Keep artifacts and implementation in sync**
3. **Submit focused PRs** with clear scope
4. **Include tests** when behavior changes

Before submitting:
- Ensure your change follows the Firehose workflow
- Update documentation if you modify the process
- Test your changes thoroughly

---

## 📊 Project Status

**Current Phase:** Foundation & Governance

This repository currently defines the process and governance baseline. Implementation-specific modules can be added incrementally under the same workflow.

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
