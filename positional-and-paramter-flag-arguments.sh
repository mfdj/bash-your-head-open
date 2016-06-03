#!/usr/bin/env bash

echo "
  argument zero is the path used to execute your script

  \$0          : $0
  basename \$0 : `basename $0`
  dirname \$0  : `dirname $0`
"

position=1
for word in $*; do
  echo "  position $position is word: '$word'"
  ((position++))
done

position=1
while [[ $position -le $# ]]; do
  word=${!position}
  if [[ $word != "-"* ]]; then ((position++)) # not a flag so advance position
  else
    ((next_position = position + 1))
    splice=1

    case $word in
      # paramter-flags with arguments
      --environment=*) environment="${word#*=}";;
      -e)              environment="${!next_position}"; ((splice++));;

      # binary flags
      -q|--quiet) quiet=true;;
              -d) debug=true;;
    esac

    # splice out paramters and arguments from $@ list
    [[ $position -gt 1 ]] \
      && set -- ${@:1:((position - 1))} ${@:((position + splice)):$#} \
      || set -- ${@:((position + splice)):$#};
  fi
done

# positional remain
node_name=$1
ip_address=$2

echo "
processed arguments + parameters

  node_name    : $node_name (poistion 1)
  ip_address   : $ip_address (poistion 2)
  environment  : $environment (paramter flag + argument)
  quiet        : $quiet (binary flag)
  debug        : $debug (binary flag)
"
