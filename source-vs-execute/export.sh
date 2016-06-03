#!/usr/bin/env bash

echo 'export.sh mutated $OUTER'

OUTER='was modified from export.sh'

export OUTER
