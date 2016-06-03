#!/usr/bin/env bash

command -v brew   > /dev/null || { echo please install Homebrew; exit 1; }
command -v figlet > /dev/null || brew install figlet

packaged_fonts=$(ls -l1 `brew --prefix figlet`/share/figlet/fonts | grep flf)

for font in $packaged_fonts; do
  echo '- - - - - - - - - - - - - - - - - - - - - - - -'
  echo "$font"
  figlet -f $font $1
done
