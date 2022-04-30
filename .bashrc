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
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias diff='diff --color'
alias less='less -i'

# Sed
alias sed='sed -E'

# Grep
alias grep='grep -P --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'


#-----------------------------------------------------------------------------#
# Init Shell Utilities                                                        #
#-----------------------------------------------------------------------------#
#
# Conda initialize
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Pyenv init
eval "$(pyenv init -)"


#-----------------------------------------------------------------------------#
# Bash Plugins                                                                #
#-----------------------------------------------------------------------------#
#
# Starship
eval "$(starship init bash)"
