#!/usr/bin/env zsh

cd "$(dirname "${(%):-%N}")";

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "brew.sh" \
		--exclude "init" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.zshrc;
}

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
	doIt;
else
	read REPLY\?"This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
