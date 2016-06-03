#!/usr/bin/env bash

echo '
The difference between $@ and $* is only present when looping over quoted.
see: http://www.tldp.org/LDP/abs/html/internalvariables.html#ARGLIST

----- They look the same when echoed (quoted and un) ----
'
echo '  $@  :' $@
echo '  $*  :' $*
echo -n ' "$*" : '; echo "$*"
echo -n ' "$@" : '; echo "$@"

echo '
----- They have the same structure when looping unquoted -----

for word in $@; …'
position=1
for word in $@; do
  echo "  position $position is word: '$word'"
  ((position++))
done

echo '
for word in $*; …'
position=1
for word in $*; do
  echo "  position $position is word: '$word'"
  ((position++))
done

echo '
----- But are radically different when looping quoted -----

for word in "$@"; …'
position=1
for word in "$@"; do
  echo "  position $position is word: '$word'"
  ((position++))
done

echo '
for word in "$*"; …'
position=1
for word in "$*"; do
  echo "  position $position is word: '$word'"
  ((position++))
done
