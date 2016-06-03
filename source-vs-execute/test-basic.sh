#!/usr/bin/env bash

root=$(dirname $0)

OUTER='initial outer value'

echo
echo "\$OUTER : '$OUTER'"
echo
echo --------------------------------------------
echo "#1a: execute module.sh"
$root/module.sh

echo
echo "#1b: execute modify.sh"
$root/modify.sh
echo "test.sh sees \$OUTER : '$OUTER'"

echo
echo --------------------------------------------
echo "#2a: source module.sh"
source $root/module.sh

echo
echo "#2b: source modify.sh"
source $root/modify.sh
echo "test.sh sees \$OUTER : '$OUTER'"