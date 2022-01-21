#!/usr/bin/env bash

# Get the latest major version of Ruby
ruby_maj_ver="$(ls $HOME/.local/share/gem/ruby | grep $(ruby -v | cut -d ' ' -f 2 | cut -d . -f 1,2))"

# Add to PATH
export PATH="$HOME/.cargo/bin:$HOME/.bin:/usr/local/bin:$HOME/.local/share/gem/ruby/$ruby_maj_ver/bin:$PATH"

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="/home/aashishp/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Change this to the name of the main development branch if
# you renamed it or if it was changed for some reason
# export BASH_IT_DEVELOPMENT_BRANCH='master'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true
# Set to actual location of gitstatus directory if installed
#export SCM_GIT_GITSTATUS_DIR="$HOME/gitstatus"
# per default gitstatus uses 2 times as many threads as CPU cores, you can change this here if you must
#export GITSTATUS_NUM_THREADS=8

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# If your theme use command duration, uncomment this to
# enable display of last command duration.
#export BASH_IT_COMMAND_DURATION=true
# You can choose the minimum time in seconds before
# command duration is displayed.
#export COMMAND_DURATION_MIN_SECONDS=1

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1

# Uncomment this to show last command duration
export BASH_IT_COMMAND_DURATION=true
export COMMAND_DURATION_MIN_SECONDS=5

# Uncomment this to hide clock character from prompt
export THEME_SHOW_CLOCK_CHAR=false

# Uncomment this to hide clock from prompt
export THEME_SHOW_CLOCK=false

# Load Bash It
source "$BASH_IT"/bash_it.sh

#-----------------------------------------------------------------------------#
# My Custom Configurations                                                    #
#-----------------------------------------------------------------------------#

# Scrips
#-----------------------------------------------#

# MDN "Rendering Error" fix for Zeal
zeal-docs-fix() {
    pushd "$HOME/.local/share/Zeal/Zeal/docsets" >/dev/null || return
    find . -iname 'react-main*.js' -exec rm '{}' \;
    popd >/dev/null || exit
}

# Pyenv init
eval "$(pyenv init -)"

# Environment Variables
#-----------------------------------------------#

# Using vi as bash keybinds
set -o vi

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

# Set the DISPLAY variable
export DISPLAY=:1

# For gpg-agent
GPG_TTY=$(tty)
export GPG_TTY

# Enable using $EDITOR for nnn
export NNN_USE_EDITOR=1

# Enable wayland display for mozilla firefox
if echo $WAYLAND_DISPLAY | grep -q "wayland-."; then
    export MOZ_ENABLE_WAYLAND=1
else
    export MOZ_ENABLE_WAYLAND=0
fi

# Aliases
#-----------------------------------------------#

# Meta aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias c='clear'
alias ecode='echo $?'
alias Syyu='sudo pacman -Syyu --color auto'
alias diff='diff --color'
alias less='less -i'

# Vim
alias vi='nvim'
alias vimconf='nvim ~/.vimrc'

# Sed
alias sed='sed -E'

# Grep
alias grep='grep -P --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# Shell Utilities
#-----------------------------------------------#

# Initialize NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# <<< conda initialize <<<
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
