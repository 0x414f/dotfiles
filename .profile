#!/usr/bin/env bash

if [ -n "$PROFILE_SOURCED" ]; then
  echo "$(pwd)/.profile has already been sourced."
  return
else 
  PROFILE_SOURCED=1
fi

[ -n "$PS1" ] && source ~/.bash_profile;

