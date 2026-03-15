#!/usr/bin/env bash
# Lint .docs/templates/ — verify each template has the required structure.
# Exit 0 if all pass, exit 1 if any fail.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TEMPLATES_DIR="$REPO_ROOT/.docs/templates"
FAIL=0

pass() { echo "  ✓ $1"; }
fail() { echo "  ✗ $1"; FAIL=1; }

check_heading() {
  local file="$1" heading="$2"
  if grep -q "^#.*$heading" "$file" 2>/dev/null; then
    pass "$file has heading: $heading"
  else
    fail "$file missing heading: $heading"
  fi
}

check_exists() {
  local file="$1"
  if [[ -f "$file" ]]; then
    pass "$file exists"
  else
    fail "$file is missing"
    return 1
  fi
}

echo "=== Template Lint ==="
echo ""

# --- proposal.md ---
echo "proposal.md:"
if check_exists "$TEMPLATES_DIR/proposal.md"; then
  check_heading "$TEMPLATES_DIR/proposal.md" "Why"
  check_heading "$TEMPLATES_DIR/proposal.md" "Scope"
  check_heading "$TEMPLATES_DIR/proposal.md" "Out of Scope"
  check_heading "$TEMPLATES_DIR/proposal.md" "Success Criteria"
fi
echo ""

# --- spec.md ---
echo "spec.md:"
if check_exists "$TEMPLATES_DIR/spec.md"; then
  check_heading "$TEMPLATES_DIR/spec.md" "Requirements"
  check_heading "$TEMPLATES_DIR/spec.md" "Requirement:"
  check_heading "$TEMPLATES_DIR/spec.md" "Scenario:"
  # Check for RFC 2119 keywords
  if grep -qE '\b(SHALL|MUST|SHOULD|MAY)\b' "$TEMPLATES_DIR/spec.md"; then
    pass "spec.md uses RFC 2119 keywords"
  else
    fail "spec.md missing RFC 2119 keywords (SHALL, MUST, SHOULD, MAY)"
  fi
  # Check for Given/When/Then
  if grep -q "GIVEN" "$TEMPLATES_DIR/spec.md" && grep -q "WHEN" "$TEMPLATES_DIR/spec.md" && grep -q "THEN" "$TEMPLATES_DIR/spec.md"; then
    pass "spec.md has Given/When/Then structure"
  else
    fail "spec.md missing Given/When/Then structure"
  fi
fi
echo ""

# --- design.md ---
echo "design.md:"
if check_exists "$TEMPLATES_DIR/design.md"; then
  check_heading "$TEMPLATES_DIR/design.md" "Approach"
  check_heading "$TEMPLATES_DIR/design.md" "Key Decisions"
  check_heading "$TEMPLATES_DIR/design.md" "Files Changed"
  check_heading "$TEMPLATES_DIR/design.md" "Risks"
fi
echo ""

# --- tasks.md ---
echo "tasks.md:"
if check_exists "$TEMPLATES_DIR/tasks.md"; then
  check_heading "$TEMPLATES_DIR/tasks.md" "Checklist"
  if grep -q '\- \[ \]' "$TEMPLATES_DIR/tasks.md"; then
    pass "tasks.md has checkbox format"
  else
    fail "tasks.md missing checkbox format (- [ ])"
  fi
fi
echo ""

# --- completion.md ---
echo "completion.md:"
if check_exists "$TEMPLATES_DIR/completion.md"; then
  check_heading "$TEMPLATES_DIR/completion.md" "What Changed"
  check_heading "$TEMPLATES_DIR/completion.md" "How to Verify"
  check_heading "$TEMPLATES_DIR/completion.md" "Risks"
fi
echo ""

# --- PRD.md ---
echo "PRD.md:"
if check_exists "$TEMPLATES_DIR/PRD.md"; then
  check_heading "$TEMPLATES_DIR/PRD.md" "Purpose"
  check_heading "$TEMPLATES_DIR/PRD.md" "Goals"
  check_heading "$TEMPLATES_DIR/PRD.md" "Non-Goals"
  check_heading "$TEMPLATES_DIR/PRD.md" "Constraints"
fi
echo ""

if [[ $FAIL -eq 0 ]]; then
  echo "=== All template checks passed ==="
else
  echo "=== Some template checks FAILED ==="
  exit 1
fi
