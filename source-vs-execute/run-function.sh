#!/usr/bin/env bash

echo "run-function.sh sees \$OUTER before mutation : '$OUTER'"

change_outer "value from run-function"

echo "run-function.sh sees \$OUTER after mutation : '$OUTER'"