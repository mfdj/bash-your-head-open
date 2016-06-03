#!/usr/bin/env bash

root=$(dirname $0)

change_outer() {
	OUTER=$1
}

change_outer 'initial outer value'

echo
echo "\$OUTER : '$OUTER'"
echo
echo --------------------------------------------
echo "#1 execute run-function.sh"
$root/run-function.sh
echo "runner sees \$OUTER : '$OUTER'"

echo
echo --------------------------------------------

export -f change_outer

echo "#3 execute run-function.sh"
$root/run-function.sh
echo "runner sees \$OUTER : '$OUTER'"

echo
echo --------------------------------------------

export OUTER

echo "#2 execute run-function.sh"
$root/run-function.sh
echo "runner sees \$OUTER : '$OUTER'"
