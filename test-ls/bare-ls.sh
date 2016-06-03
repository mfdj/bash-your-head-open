#!/usr/bin/env bash

cd "${0%/*}" # ensure current-working-directory is correct

source _test_functions.sh

cleanup
setup
write_file x
write_file y
write_file z

echo && echo 'bare ls sorts alpha' && echo
test_ls

echo && echo 'r flag reverses' && echo

test_ls -r
