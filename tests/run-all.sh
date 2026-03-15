#!/usr/bin/env bash
# Run all Firehose tests.
# Exit 0 if everything passes, exit 1 on first failure.

set -euo pipefail

TESTS_DIR="$(cd "$(dirname "$0")" && pwd)"
OVERALL=0

run_test() {
  local name="$1" script="$2"
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo " $name"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
  if bash "$script"; then
    echo ""
    echo "→ $name: PASSED"
  else
    echo ""
    echo "→ $name: FAILED"
    OVERALL=1
  fi
}

run_test "Template Lint"          "$TESTS_DIR/lint-templates.sh"
run_test "Golden Path Validation" "$TESTS_DIR/validate-golden-path.sh"
run_test "LLM Smoke Test"        "$TESTS_DIR/smoke-llm.sh"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [[ $OVERALL -eq 0 ]]; then
  echo " ALL TESTS PASSED"
else
  echo " SOME TESTS FAILED"
fi
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

exit $OVERALL
