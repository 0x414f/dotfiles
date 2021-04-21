#!/usr/bin/env bash

mkdir -p ~/.dot

# Remove "Last login: ..." message from new terminals.
touch ~/.hushlogin

. git/setup.sh
