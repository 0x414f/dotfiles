#!/usr/bin/env bash

antibody bundle < <(
  echo "zsh-users/zsh-completions"
  echo "zsh-users/zsh-autosuggestions"
) > ~/.zsh_plugins

antibody update

if ! grep -q '/usr/local/bin/zsh' '/etc/shells'; then
  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
fi

if [[ "$SHELL" != '/usr/local/bin/zsh' ]]; then
  chsh -s /usr/local/bin/zsh
fi
