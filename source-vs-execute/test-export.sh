#!/usr/bin/env bash

root=$(dirname $0)

OUTER='initial outer value'

export OUTER

echo
echo "\$OUTER : '$OUTER'"
echo
echo --------------------------------------------
echo "#1a: execute module.sh"
$root/module.sh

echo
echo "#1b: execute modify.sh"
$root/modify.sh
echo "runner sees \$OUTER : '$OUTER'"

echo
echo "#1c: execute export.sh"
$root/export.sh
echo "runner sees \$OUTER : '$OUTER'"
