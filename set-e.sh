#!/usr/bin/env bash

set -e

risky-command() {
	(>&2 echo "$1 was 😳")
	return 1
}

echo 'set -e will stop when a command emits an error code (anything greater than 0)'
echo

# outputs error to stderr but won't halt operation
risky-command eh || true
captured="$(risky-command bee 2> /dev/null || true)"

# ditto above but swallows stderr
risky-command see 2> /dev/null || true
captured="$(risky-command dee || true)"

echo "captured 4 errors with '… || true'"
echo

# capture error
if risky-command eeee; then
   :
fi

# capture error silently
if risky-command efff 2> /dev/null; then
   :
fi

echo "captured 2 errors with 'if … ; then …; fi'"
echo

#3 (notice again) without true this fails
risky-command geee

echo "this line won't be evaluated because set -e will stop script execution"
