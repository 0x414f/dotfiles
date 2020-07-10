#!/usr/bin/env bash

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

ln -sf $dir/rc ~/.dot/gitrc
ln -sf $dir/gitignore ~/.gitignore
ln -sf $dir/gitconfig ~/.gitconfig
