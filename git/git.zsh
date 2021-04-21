#!/usr/bin/env bash

alias g="git"

function gb() {
  preview='git diff {} $(git-not-mine {}) --color=always'

  git branch --no-color | \
    sed 's/[* ]//g' | \
    fzf-tmux -m --ansi --preview $preview
}

function gd() {
  if [[ $# -eq 0 ]]; then
    args="$(git-not-mine)"
  else
    args=$@
  fi

  preview="git diff $args --color=always -- {-1}"

  git diff $args --name-only | fzf-tmux -m --ansi --preview $preview
}

# Get first commit that's not mine
function git-not-mine() {
  git log -n 100 --pretty='%h%x09%an' $1 | \
    rg -m 1 -v -i 'antonio.*ochoa' | \
    cut -c 1-10
}
