#!/usr/bin/env bash

cd "${0%/*}" # ensure current-working-directory is correct

source _test_functions.sh

cleanup
setup

# NOTE: slow_write sleeps a second so timestamps will actually be different

# accessed, modified, changed, birthed will al be the same value
slow_write x_first
slow_write z_second
slow_write y_third

# modified, changed will be the same value and different from accessed, birthed
slow_write x_first
slow_write z_second
slow_write y_third

echo && echo 'here are the timestamps:' && echo

# NOTE: `stat -t …` won't effect timestamps becuase we use a custom `-f …` format
# - `stat -t %r sandobx/*` would show hours-minutes-seconds
# - `stat -t %s sandobx/*` uses unix-timestamp
(
  echo file accessed modified changed birthed;
  stat -f "%N %a %m %c %B" sandbox/*
) | column -t

echo && echo 'ls with -tU flags sorts by creation (newest first)' && echo

test_ls -tU

echo && echo 'add the reverse flags (-tUr) for oldest first' && echo

test_ls -tUr

echo && echo 'ls with -tc flags sorts by changed (recent first)' && echo

test_ls -tc

echo && echo 'add the reverse flags (-tcr) for least-recent first' && echo

test_ls -tcr

echo && echo 'ls with -t flag sorts by modified (recent first)' && echo

test_ls -t

echo && echo 'add the reverse flags (-tr) for least-recent first' && echo

test_ls -tr
