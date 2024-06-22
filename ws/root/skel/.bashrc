
set -o vi

export PATH="$HOME/bin:$PATH"
export EDITOR=vim

# Some ls aliases
alias ll='ls -al'

# HISTORY Configuration
# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE
HISTSIZE=
HISTFILESIZE=

