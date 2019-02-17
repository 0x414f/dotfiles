#!/usr/bin/env bash

if [ -n "$BASHRC_SOURCED" ]; then
  echo "$(pwd)/.bashrc has already been sourced."
  return
else 
  BASHRC_SOURCED=1
fi

[ -n "$PS1" ] && source ~/.bash_profile;
