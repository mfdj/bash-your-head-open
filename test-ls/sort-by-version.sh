#!/usr/bin/env bash

cd "${0%/*}" # ensure current-working-directory is correct

source _test_functions.sh

cleanup
setup
write_file 1
write_file 10
write_file 100
write_file 50.1
write_file 50.10
write_file 50.01
write_file 50.2
write_file 51
write_file 50.2

echo list
test_ls -l1

echo && echo reverse
test_ls -l1r

cleanup
