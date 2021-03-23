# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 0077
export PS1="\u@\h:\w\\$ "

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -r "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
    # Adds ~/bin to PATH if exists
    if [ -d "$HOME/bin" ]; then
        PATH="$HOME/bin:$PATH"
    fi
    # Adds ~/usr/bin to PATH if exists
    if [ -d "$HOME/usr/bin" ]; then
        PATH="$HOME/usr/bin:$PATH"
    fi
    # Adds ~/.local/bin to PATH if exists
    if [ -d "$HOME/.local/bin" ]; then
        PATH="$HOME/.local/bin:$PATH"
    fi
fi

if [ -r ~/.profile_ext ]; then
    . ~/.profile_ext
fi
