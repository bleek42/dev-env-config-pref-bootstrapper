#!/bin/bash

config_dir="$HOME/.config"
if [ -d "$config_dir/bash" ]; then
	for script in "$config_dir"/bash/*.sh; do
		source "$script"
	done
fi

case $- in
*i*) ;;

*) return ;;
esac

# # Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Don't store lines starting with a space in the history, or lines identical to the one before.
# ═══════════════════════════════════════
# HISTORY MANAGEMENT
# ═══════════════════════════════════════
# append to the history file, don't overwrite it
shopt -s histappend
# set length of command history rememebered
# make sure this isn't overrided by the OS (Ubuntu does this)
# make cd ignore case and small typos
shopt -s cdspell

unset HISTFILESIZE
unset HISTSIZE
HISTSIZE=2000
HISTFILESIZE=4000
HISTCONTROL='ignorespace:ignoredups'
# Store timestamps in history file, and display them as 'Mon 2020-06-01 23:42:05'.
HISTTIMEFORMAT='%a %Y-%m-%d %H:%M:%S'

# If this shell is connected to a tty, disable software flow control.
# In other words, prevent accidentally hitting ^S from freezing the entire terminal.
[ -t 0 ] && stty -ixon 2>/dev/null

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/bash lesspipe)"

# # Modify path here:
# export MASTERPATH=$PATH
# Editor for git and other commands
export EDITOR='micro'
export VISUAL='code-insiders'

# ═══════════════════════════════════════
# COLORS FOR COMMON COMMANDS
# ═══════════════════════════════════════

# Give less options to man
export MANPAGER='less -s -M +Gg'
