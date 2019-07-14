#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="/home/superap/bin/bash-it"

# Lock and Load a custom theme file
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

# Environment Variable(s) for bumblebee
export VGL_READBACK=pbo

# Environment Variable for Vulkan
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json

#-----------------------------------------------------------------------------#
# My Custom Configurations                                                    #
#-----------------------------------------------------------------------------#

# Environment Variables
#-----------------------------------------------#
export XDG_CONFIG_HOME=$HOME/.config

# Using vi as bash keybinds
set -o vi

# Increasing history size
export HISTSIZE=1000

# For gpg-agent
GPG_TTY=$(tty)
export GPG_TTY

# Aliases
#-----------------------------------------------#

# Vim
export VISUAL='nvim'
alias vi='/usr/bin/vim'
alias vim='nvim'

# Anaconda
alias anaconds-navigator='exec /opt/anaconda/bin/anaconda-navigator &'
alias spyder='exec /opt/anaconda/bin/spyder &'

# DBeaver
alias dbeaver='/home/superap/bin/dbeaver/dbeaver &'

# Browsers
alias chrome-dev='google-chrome-unstable'

# Books
alias CLRS='zathura ~/Documents/NAALEDGE/Algorithms/Introduction_to_algorithm/Introduction-to-algorithms-3rd-edition.pdf &'
alias Eloquent_JavaScript='zathura ~/Documents/NAALEDGE/JavaScript/Eloquent_JavaScript-3rd_Edition.pdf &'
alias Fundamentals_Database='zathura ~/Documents/NAALEDGE/Database/Fundamentals_of_Database_Systems-7th_edition.pdf &'
alias HTML5_The_Missing_Manual=' zathura ~/Documents/NAALEDGE/HTML_and_CSS/HTML5-The_Missing_Manual-2nd_Edition.pdf &'
alias HTML_and_CSS='zathura ~/Documents/NAALEDGE/HTML_and_CSS/Jon_Duckett_HTML_and_CSS.pdf &'
alias CSS3_The_Missing_Manual='zathura ~/Documents/NAALEDGE/HTML_and_CSS/CSS-The-Missing-Manual-4th.pdf &'
alias Learning_Python='zathura ~/Documents/NAALEDGE/Python/LearningPython.pdf &'
alias Rosen='zathura ~/Documents/NAALEDGE/Discrete_Math/Rosen_Discrete_Mathematics_and_Its_Applications-7th_Edition.pdf &'
alias Atomic_Habits='zathura ~/Documents/Literature/Worldly_Wisdom/Atomic_Habits-James_Clear.epub &'
alias Art_of_the_Start='zathura ~/Documents/NAALEDGE/StartUp/The_Art_of_the_Start-Guy_Kawasaki.epub &'
alias The_7_Habits='zathura ~/Documents/Literature/Worldly_Wisdom/The_7_Habits_of_Highly_Effective_People-Stephen_R_Covey.pdf &'
alias JavaScript_Ninja='zathura ~/Documents/NAALEDGE/JavaScript/Secrets_of_the_JavaScript_Ninja-2nd_Edition.pdf &'
alias C++_Primer='zathura ~/Documents/NAALEDGE/C-C++/C++.Primer.5th.Edition.pdf &'
alias C_Programming='zathura ~/Documents/NAALEDGE/C-C++/C_Programming_A_Modern_Approach_2nd_Ed.pdf &'
alias Practical_Vim='zathura ~/Documents/NAALEDGE/Vim/Drew\ Neil\ -\ Practical\ Vim\ Edit\ Text\ at\ the\ Speed\ of\ Thought\,\ 2nd\ Edition\ -\ 2015.pdf &'
alias Clean_Code='zathura ~/Documents/NAALEDGE/Clean_Code/Clean_Code.pdf &'
alias Feller='zathura ~/Documents/NAALEDGE/Probability/AnIntroductionToProbabilityTheoryAndItsApplications-I.pdf &'
alias Probability_Theory='zathura ~/Documents/NAALEDGE/Probability/JaynesProbabilityTheory.pdf &'
alias Concrete_Math='zathura ~/Documents/NAALEDGE/Discrete_Math/Concrete_Mathematics-2e.pdf &'
alias Bevlin='zathura ~/Documents/Literature/Seeking_Wisdom_From_Darwin_To_Munger/Seeking_Wisdom.pdf &'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/superap/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/superap/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/superap/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/superap/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias config='/usr/bin/git --git-dir=/home/superap/.dotfiles --work-tree=/home/superap'
