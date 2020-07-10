#!/usr/bin/env bash

[[ "$dot_util" == 1 ]] && return 0
dot_util=1

dot=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")

dot_cleanup() {
  unset dot
  unset dot_util
  unset -f dot_cleanup
}

trap dot_cleanup EXIT
