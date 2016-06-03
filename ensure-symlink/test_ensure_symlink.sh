#!/usr/bin/env bash

cd "${0%/*}" # ensure current-working-directory is correct

source ensure-symlink.sh

# clean + prepare
rm -rf result-*
tree
base_path=$PWD
prepare_test() {
  echo && echo "::::::::::::: test-$1 :::::::::::::" && echo
  testfolder=$base_path/result-$1
  mkdir -p $testfolder
  cp -R scenario/* $testfolder
}

# make symlink, test two quoted strings
prepare_test 1
rm -rf "$testfolder/the destination"
ensure_symlink "$testfolder/a cool source" "$testfolder/the destination"
echo
tree $testfolder
echo
ls -l1 "$testfolder/the destination/" # NOTE: ls will follow symlink if path ends with slash

# escaped spaces, also test backup feature
prepare_test 2
ensure_symlink $testfolder/a\ cool\ source/ $testfolder/the\ destination/
ensure_symlink $testfolder/a\ cool\ source/ $testfolder/the\ destination/
ensure_symlink $testfolder/a\ cool\ source/ $testfolder/the\ destination/
echo
tree $testfolder
echo
ls -l1 $testfolder/the\ destination/

# backup folders will be replaced, not nested
prepare_test 3
mkdir "$testfolder/the destination-backup"
touch "$testfolder/the destination-backup/this-should-be-replaced"
tree $testfolder
echo
ensure_symlink "$testfolder/a cool source" "$testfolder/the destination"
ensure_symlink "$testfolder/a cool source" "$testfolder/the destination"
echo
tree $testfolder
echo
ls -l1 $testfolder/the\ destination/

# files will be backedup
prepare_test 4
mkdir "$testfolder/the destination-backup"
touch "$testfolder/the destination-backup/this-should-be-replaced"
tree $testfolder
echo
ensure_symlink "$testfolder/a cool source" "$testfolder/the destination"
ensure_symlink "$testfolder/a cool source" "$testfolder/the destination"
echo
tree $testfolder
echo
ls -l1 $testfolder/the\ destination/

