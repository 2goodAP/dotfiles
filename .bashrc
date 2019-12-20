#!/usr/bin/env bash

# Add to PATH
export PATH=$HOME/.cargo/bin:$HOME/.bin:/usr/local/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH:/opt/android-sdk/platform-tools

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
export BASH_IT_THEME='powerline'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

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

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

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

# Load Bash It
source "$BASH_IT"/bash_it.sh

#-----------------------------------------------------------------------------#
# My Custom Configurations                                                    #
#-----------------------------------------------------------------------------#

# Scrips
#-----------------------------------------------#

# Configs fo nnn
n ()
{
    # Block nesting of nnn in subshells
    if [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, export NNN_TMPFILE after the call to nnn
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

zeal-docs-fix() {
    pushd "$HOME/.local/share/Zeal/Zeal/docsets" >/dev/null || return
    find . -iname 'react-main*.js' -exec rm '{}' \;
    popd >/dev/null || exit
}

# Environment Variables
#-----------------------------------------------#

export NNN_USE_EDITOR=1

# Set the XDG_CONFIG_HOME
export XDG_CONFIG_HOME=$HOME/.config

# Using vi as bash keybinds
set -o vi

# Increasing history size
export HISTSIZE=1000

# For gpg-agent
GPG_TTY=$(tty)
export GPG_TTY

# Enable wayland display for mozilla firefox
if echo $WAYLAND_DISPLAY | grep -q "wayland-."; then
    export MOZ_ENABLE_WAYLAND=1
else
    export MOZ_ENABLE_WAYLAND=0
fi

# Set TERM variable
export TERM=xterm-256color

# Set the DISPLAY variable
export DISPLAY=:0

# Using neovim as the default shell editor
export VISUAL='nvim'

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Aliases
#-----------------------------------------------#

# Meta aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias c='clear'
alias cls='clear && ls'
alias Syyu='sudo pacman -Syyu --color auto'
alias diff='diff --color'
alias less='less -i'
alias hibernate='sudo systemctl hibernate'

# Vim
alias v='nvim'
alias vi='nvim'
alias vimconf='nvim ~/.vimrc'

# nnn
alias n='nnn'

# Anaconda
alias anaconds-navigator='exec /opt/anaconda/bin/anaconda-navigator &'
alias spyder='exec /opt/anaconda/bin/spyder &'
alias conda='sudo /opt/anaconda/condabin/conda'

# Grep
alias grep='grep -E --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# Books
alias CLRS='zathura ~/Documents/NAALEDGE/Algorithms/Introduction_to_algorithm/Introduction-to-algorithms-3rd-edition.pdf &'
alias Eloquent_JavaScript='zathura ~/Documents/NAALEDGE/JavaScript/Eloquent_JavaScript-3rd_Edition.pdf &'
alias Fundamentals_Database='zathura ~/Documents/NAALEDGE/Database/Fundamentals_of_Database_Systems-7th_edition.pdf &'
alias CSS3_The_Missing_Manual='zathura ~/Documents/NAALEDGE/HTML_and_CSS/CSS-The-Missing-Manual-4th.pdf &'
alias Learning_Python='zathura ~/Documents/NAALEDGE/Python/LearningPython.pdf &'
alias C_Programming='zathura ~/Documents/NAALEDGE/C-C++/C_Programming_A_Modern_Approach_2nd_Ed.pdf &'
alias Practical_Vim='zathura ~/Documents/NAALEDGE/Vim/Drew\ Neil\ -\ Practical\ Vim\ Edit\ Text\ at\ the\ Speed\ of\ Thought\,\ 2nd\ Edition\ -\ 2015.pdf &'
alias Clean_Code='zathura ~/Documents/NAALEDGE/Clean_Code/Clean_Code.pdf &'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# NVM installation
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

