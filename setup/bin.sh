#!/usr/bin/env bash

set -e

cd -P -- "$(dirname -- "$0")/.."
dot="$(pwd -P)"

mkdir -p ~/.bin
cp -r $dot/bin/ ~/.bin
