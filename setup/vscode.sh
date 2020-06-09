#!/usr/bin/env bash
set -e
source setup/util.sh

code \
	--install-extension bungcip.better-toml \
  --install-extension dakara.dakara-foldplus \
  --install-extension eamodio.gitlens \
  --install-extension pkief.material-icon-theme \
  --install-extension rust-lang.rust \
  --install-extension serayuzgur.crates \
  --install-extension silvenon.mdx \
  --install-extension tomphilbin.gruvbox-themes \
  --install-extension visualstudioexptteam.vscodeintellicode \
  --install-extension vscodevim.vim
