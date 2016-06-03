#!/usr/bin/env bash

counter=0

inc() {
   ((counter++))
   echo "context $1 increments counter to $counter"
}

inc '> root'
inc '> root'

echo "$(
   inc '>> sub1'
   inc '>> sub1'
)"

inc '> root'
inc '> root'

echo "$(
   inc '>> sub2'
   echo "$(
      inc '>>> sub-2-sub'
   )"
   inc '>> sub 2'
)"

inc '> root'
