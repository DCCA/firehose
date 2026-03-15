#!/usr/bin/env bash
# LLM Smoke Test for Firehose
#
# This test simulates what happens when an LLM adopts Firehose:
# 1. Creates a temp directory (fake project)
# 2. Copies FIREHOSE.md and templates in
# 3. Simulates an LLM following the Scope loop by creating change artifacts
# 4. Validates the output matches what FIREHOSE.md prescribes
#
# This is NOT calling an actual LLM — it's testing that the structure
# described in FIREHOSE.md is internally consistent and followable.
# For actual LLM testing, see the section at the bottom.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMPDIR=$(mktemp -d)
FAIL=0

pass() { echo "  ✓ $1"; }
fail() { echo "  ✗ $1"; FAIL=1; }

cleanup() { rm -rf "$TMPDIR"; }
trap cleanup EXIT

echo "=== LLM Smoke Test ==="
echo "Simulating Firehose adoption in: $TMPDIR"
echo ""

# --- Step 1: Simulate Quick Start (copy FIREHOSE.md + templates) ---
echo "Step 1: Quick Start setup"
cp "$REPO_ROOT/FIREHOSE.md" "$TMPDIR/"
mkdir -p "$TMPDIR/.docs/templates" "$TMPDIR/.docs/todo" "$TMPDIR/.docs/doing" "$TMPDIR/.docs/done"
cp "$REPO_ROOT/.docs/templates/"*.md "$TMPDIR/.docs/templates/"

if [[ -f "$TMPDIR/FIREHOSE.md" ]]; then
  pass "FIREHOSE.md copied"
else
  fail "FIREHOSE.md not found"
fi

template_count=$(ls "$TMPDIR/.docs/templates/"*.md 2>/dev/null | wc -l)
if [[ "$template_count" -ge 5 ]]; then
  pass "$template_count templates copied"
else
  fail "Only $template_count templates found (need at least 5)"
fi
echo ""

# --- Step 2: Simulate Loop 1 (Scope) — create a change folder ---
echo "Step 2: Simulate Loop 1 (Scope)"
CHANGE_DIR="$TMPDIR/.docs/doing/fix-login-bug"
mkdir -p "$CHANGE_DIR"

# Copy and fill proposal.md (simulating what an LLM would do)
cat > "$CHANGE_DIR/proposal.md" << 'PROPOSAL'
# Proposal: Fix Login Bug

## Why

Users are getting 500 errors when logging in with special characters in their password.

## Scope

- Fix password encoding in the auth handler.
- Add test for special character passwords.

## Out of Scope

- Password policy changes.
- OAuth login flow.

## Success Criteria

- Users can log in with passwords containing &, <, >, and quotes.
- Existing login tests still pass.
PROPOSAL

# Copy and fill tasks.md
cat > "$CHANGE_DIR/tasks.md" << 'TASKS'
# Tasks: Fix Login Bug

## Checklist

- [ ] 1. Reproduce the bug with a failing test
- [ ] 2. Fix URL encoding in auth handler
- [ ] 3. Verify all existing auth tests pass
TASKS

if [[ -f "$CHANGE_DIR/proposal.md" && -f "$CHANGE_DIR/tasks.md" ]]; then
  pass "Change folder created with proposal.md + tasks.md"
else
  fail "Change folder missing required files"
fi

# Validate proposal has all required sections
for section in "Why" "Scope" "Out of Scope" "Success Criteria"; do
  if grep -q "## $section" "$CHANGE_DIR/proposal.md"; then
    pass "proposal.md has '$section' section"
  else
    fail "proposal.md missing '$section' section"
  fi
done
echo ""

# --- Step 3: Simulate Loop 2 (Build) — check off tasks ---
echo "Step 3: Simulate Loop 2 (Build)"
sed -i 's/- \[ \] 1\./- [x] 1./' "$CHANGE_DIR/tasks.md"
sed -i 's/- \[ \] 2\./- [x] 2./' "$CHANGE_DIR/tasks.md"
sed -i 's/- \[ \] 3\./- [x] 3./' "$CHANGE_DIR/tasks.md"

unchecked=$(grep -c '\- \[ \]' "$CHANGE_DIR/tasks.md" || true)
unchecked=${unchecked:-0}
if [[ "$unchecked" -eq 0 ]]; then
  pass "All tasks checked off"
else
  fail "$unchecked tasks still unchecked"
fi
echo ""

# --- Step 4: Simulate Loop 3 (Verify) — write completion, move to done ---
echo "Step 4: Simulate Loop 3 (Verify)"
cat > "$CHANGE_DIR/completion.md" << 'COMPLETION'
# Completion: Fix Login Bug

## What Changed

Fixed URL encoding in the auth handler to properly escape special characters.

## How to Verify

1. Try logging in with password: `p@ss&word<>"`
2. Run `npm test` — all auth tests pass.

## Risks & Follow-ups

- No risks identified. Low blast radius change.
COMPLETION

if [[ -f "$CHANGE_DIR/completion.md" ]]; then
  pass "completion.md written"
else
  fail "completion.md missing"
fi

# Move to done
mv "$CHANGE_DIR" "$TMPDIR/.docs/done/fix-login-bug"

if [[ -d "$TMPDIR/.docs/done/fix-login-bug" && ! -d "$CHANGE_DIR" ]]; then
  pass "Change folder moved from doing/ to done/"
else
  fail "Change folder not properly moved"
fi
echo ""

# --- Step 5: Validate final state ---
echo "Step 5: Validate final state"
DONE_DIR="$TMPDIR/.docs/done/fix-login-bug"

for file in proposal.md tasks.md completion.md; do
  if [[ -f "$DONE_DIR/$file" ]]; then
    pass "$file present in done/"
  else
    fail "$file missing from done/"
  fi
done

if [[ -z "$(ls -A "$TMPDIR/.docs/doing/" 2>/dev/null)" ]]; then
  pass "doing/ is empty (all work completed)"
else
  fail "doing/ still has files"
fi
echo ""

if [[ $FAIL -eq 0 ]]; then
  echo "=== LLM smoke test passed ==="
else
  echo "=== LLM smoke test FAILED ==="
  exit 1
fi

echo ""
echo "---"
echo "NOTE: This test validates structure and workflow consistency."
echo "For testing with an actual LLM, run your agent with this prompt:"
echo ""
echo '  "Read FIREHOSE.md. Then add a feature called add-search-filter'
echo '   to a hypothetical Express app. Follow all three lifecycle loops.'
echo '   Show me the .docs/ artifacts you would create."'
echo ""
echo "Then manually verify the agent created the right folder structure."
