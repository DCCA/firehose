#!/usr/bin/env bash
# Validate the golden path example in .docs/done/add-user-search/
# Checks that a completed change folder has all required artifacts
# with the right content.
# Exit 0 if all pass, exit 1 if any fail.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
EXAMPLE_DIR="$REPO_ROOT/.docs/done/add-user-search"
FAIL=0

pass() { echo "  ✓ $1"; }
fail() { echo "  ✗ $1"; FAIL=1; }

echo "=== Golden Path Validation ==="
echo "Checking: $EXAMPLE_DIR"
echo ""

# --- Required files exist ---
echo "Required files:"
for file in proposal.md spec.md tasks.md design.md completion.md; do
  if [[ -f "$EXAMPLE_DIR/$file" ]]; then
    pass "$file exists"
  else
    fail "$file is missing"
  fi
done
echo ""

# --- proposal.md has real content (not just template placeholders) ---
echo "proposal.md content:"
if grep -q '<!-- ' "$EXAMPLE_DIR/proposal.md" 2>/dev/null; then
  fail "proposal.md still has HTML comment placeholders (should be filled in)"
else
  pass "proposal.md has no unfilled placeholders"
fi
if grep -q '\[Change Name\]' "$EXAMPLE_DIR/proposal.md" 2>/dev/null; then
  fail "proposal.md still has [Change Name] placeholder"
else
  pass "proposal.md has a real title"
fi
echo ""

# --- spec.md has real scenarios ---
echo "spec.md content:"
scenario_count=$(grep -c "^#### Scenario:" "$EXAMPLE_DIR/spec.md" 2>/dev/null || echo "0")
if [[ "$scenario_count" -ge 2 ]]; then
  pass "spec.md has $scenario_count scenarios (>= 2 required)"
else
  fail "spec.md has $scenario_count scenarios (need at least 2)"
fi
if grep -q "GIVEN" "$EXAMPLE_DIR/spec.md" && grep -q "WHEN" "$EXAMPLE_DIR/spec.md" && grep -q "THEN" "$EXAMPLE_DIR/spec.md"; then
  pass "spec.md uses Given/When/Then"
else
  fail "spec.md missing Given/When/Then"
fi
echo ""

# --- tasks.md has all tasks checked off ---
echo "tasks.md content:"
unchecked=$(grep -c '\- \[ \]' "$EXAMPLE_DIR/tasks.md" 2>/dev/null || true)
unchecked=${unchecked:-0}
checked=$(grep -c '\- \[x\]' "$EXAMPLE_DIR/tasks.md" 2>/dev/null || true)
checked=${checked:-0}
if [[ "$unchecked" -eq 0 && "$checked" -gt 0 ]]; then
  pass "All $checked tasks are checked off"
else
  fail "$unchecked tasks are still unchecked"
fi
echo ""

# --- design.md has key decisions ---
echo "design.md content:"
if grep -q '|' "$EXAMPLE_DIR/design.md" 2>/dev/null; then
  pass "design.md has a decisions table"
else
  fail "design.md missing decisions table"
fi
if grep -q "Files Changed" "$EXAMPLE_DIR/design.md" 2>/dev/null; then
  pass "design.md lists files changed"
else
  fail "design.md missing files changed"
fi
echo ""

# --- completion.md has verification steps ---
echo "completion.md content:"
if grep -q "How to Verify" "$EXAMPLE_DIR/completion.md" 2>/dev/null; then
  pass "completion.md has verification steps"
else
  fail "completion.md missing verification steps"
fi
if grep -q "Risks\|Follow-up" "$EXAMPLE_DIR/completion.md" 2>/dev/null; then
  pass "completion.md documents risks/follow-ups"
else
  fail "completion.md missing risks/follow-ups"
fi
echo ""

# --- Cross-check: proposal and completion are consistent ---
echo "Cross-checks:"
if grep -qi "email" "$EXAMPLE_DIR/proposal.md" && grep -qi "email" "$EXAMPLE_DIR/completion.md"; then
  pass "proposal and completion reference the same feature"
else
  fail "proposal and completion seem to describe different things"
fi
echo ""

if [[ $FAIL -eq 0 ]]; then
  echo "=== Golden path validation passed ==="
else
  echo "=== Golden path validation FAILED ==="
  exit 1
fi
