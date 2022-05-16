#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac


#-----------------------------------------------------------------------------#
# Custom Configurations                                                       #
#-----------------------------------------------------------------------------#
#
# Enable vi mode
set -o vi

# Clear screen on Ctrl-l
bind '"\C-l": clear-screen'


#-----------------------------------------------------------------------------#
# Bash Prompt                                                                 #
#-----------------------------------------------------------------------------#
#
# Display the current git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\u@\h \w \$(parse_git_branch)\n\$ "


#-----------------------------------------------------------------------------#
# Scrips                                                                      #
#-----------------------------------------------------------------------------#
#


#-----------------------------------------------------------------------------#
# Environment Variables                                                       #
#-----------------------------------------------------------------------------#
#
# Increasing history size
export HISTSIZE=1000

# Set the XDG_CONFIG_HOME
export XDG_CONFIG_HOME=$HOME/.config

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Using neovim as the default shell editor
export VISUAL='nvim'

# Configure GPG to read input from the tty
export GPG_TTY=$(tty)


#-----------------------------------------------------------------------------#
# Aliases                                                                     #
#-----------------------------------------------------------------------------#
#
# Meta aliases
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Program aliases
alias ls='ls --color=auto'
alias ll='ls -lFh --color=auto'
alias la='ls -laFh --color=auto'
alias diff='diff --color'
alias less='less -i'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias sed='sed -E'


#-----------------------------------------------------------------------------#
# Init Shell Utilities                                                        #
#-----------------------------------------------------------------------------#
#
# Conda initialize
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh


#-----------------------------------------------------------------------------#
# Bash Plugins                                                                #
#-----------------------------------------------------------------------------#
#
