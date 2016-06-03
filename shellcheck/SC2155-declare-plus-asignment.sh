#!/usr/bin/env bash

set -e

export resilient="$(blurp)"

echo "still alive"

notresilient="$(blurp)"

echo "this won't run"
