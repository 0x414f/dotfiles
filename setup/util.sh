#!/usr/bin/env bash
set -e

[[ "$DOTFILES_SETUP_UTIL" == 1 ]] && return 0
DOTFILES_SETUP_UTIL=1

DOTFILES_ROOT=$(cd -P -- "$(dirname -- "$0")/.." && printf '%s\n' "$(pwd -P)")

prefe() {
  /usr/libexec/PlistBuddy -c "$1" ~/Library/Preferences/$2
}

dotfiles_cleanup() {
  unset -f prefe
  unset -f dotfiles_cleanup
  unset DOTFILES_ROOT
  unset DOTFILES_SETUP_UTIL
}

trap dotfiles_cleanup EXIT
