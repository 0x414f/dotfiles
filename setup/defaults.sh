#!/usr/bin/env bash
set -e
source setup/util.sh
sudo -v

# Quit System Preferences to prevent overriding settings
osascript -e 'tell application "System Preferences" to quit'

# Faster trackpad and mouse
defaults write -g com.apple.trackpad.scaling -int 3
defaults write -g com.apple.mouse.scaling -int 3

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable "Show mirroring options in the menu bar when available"
defaults write com.apple.airplay showInMenuBarIfPresent -bool false

# Expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Use plain text by default in TextEdit
defaults write com.apple.TextEdit RichText -int 0

# Finder

defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write -g AppleShowAllExtensions -bool true

# Use list view in all windows
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Keep Desktop and Documents on disk when using iCloud
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# Disable Finder transparency. It's supposed to improve performance?
defaults write com.apple.UniversalAccess reduceTransparency -bool true

# Dock

defaults write com.apple.dock tilesize -int 32
defaults write com.apple.dock orientation left
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Remove default dock icons
defaults write com.apple.dock persistent-apps -array

# Make tab available in modal dialogs
defaults write -g AppleKeyboardUIMode -int 3

# Show ~/Library
chflags nohidden ~/Library

# Disable automatic text "corrections". No thank you, Apple.
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Disable Spotlight shortcut
prefe "Set AppleSymbolicHotKeys:64:enabled false" com.apple.symbolichotkeys.plist
prefe "Set AppleSymbolicHotKeys:65:enabled false" com.apple.symbolichotkeys.plist

# Disable dock hiding
prefe "Set AppleSymbolicHotKeys:52:enabled false" com.apple.symbolichotkeys.plist

# Disable VoiceOver
prefe "Set AppleSymbolicHotKeys:59:enabled false" com.apple.symbolichotkeys.plist

defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder $DOTFILES_ROOT/prefs

defaults write com.google.Chrome ExternalProtocolDialogShowAlwaysOpenCheckbox -bool true

ln -sf $DOTFILES_ROOT/prefs/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist

for app in \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"Google Chrome" \
	"Rectangle" \
	"SystemUIServer"; do
	killall "$app" &> /dev/null
done
