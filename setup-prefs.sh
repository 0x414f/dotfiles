#!/usr/bin/env bash

set -e

DIR=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")

defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder $DIR/prefs

ln -sf $DIR/prefs/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist
