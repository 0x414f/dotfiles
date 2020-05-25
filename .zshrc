#!/usr/bin/env zsh

# Load dotfiles
for file in ~/.{path,prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

eval "$(jump shell zsh)"

source "/usr/local/share/antigen/antigen.zsh"
antigen bundle lukechilds/zsh-nvm
antigen bundle zsh-users/zsh-completions
antigen apply

# Use vi mode in command line
bindkey -v

# Exit vi-cmd-mode with 'jk'
bindkey -M viins 'jk' vi-cmd-mode

# Make backspace work in vi-cmd-mode
bindkey "^?" backward-delete-char

# Edit line in vim with ctrl-v:
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

setopt prompt_subst
setopt auto_menu
setopt complete_in_word
setopt interactivecomments
setopt no_case_glob
setopt extended_glob

# History
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt extended_history          # Write the history file in the ":start:elapsed;command" format.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
setopt hist_save_no_dups         # Don't write duplicate entries in the history file.
setopt hist_reduce_blanks        # Remove superfluous blanks before recording entry.
setopt hist_verify               # Don't execute immediately upon history expansion.

unsetopt prompt_sp

# Change cursor shape for different vi modes.
zle-keymap-select() {
	if [[ ${KEYMAP} == vicmd ]] ||
		 [[ $1 = 'block' ]]; then
		echo -ne '\e[2 q'
	elif [[ ${KEYMAP} == main ]] ||
			 [[ ${KEYMAP} == viins ]] ||
			 [[ ${KEYMAP} = '' ]] ||
			 [[ $1 = 'beam' ]]; then
		echo -ne '\e[6 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
	echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
