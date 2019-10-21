# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.cargo/bin:$HOME/bin:$HOME/.scripts:/usr/local/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH:/opt/android-sdk/platform-tools

# Path to your oh-my-zsh installation.
export ZSH="/home/superap/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode git archlinux npm colored-man-pages colorize)


# User configuration

# ZSH syntax highlighting configuration
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

# Keywords, commands and builtins are magenta
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta'

# Comments are grey
ZSH_HIGHLIGHT_STYLES[comment]='fg=#5c6370'

# Command Separators are cyan
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan'
# Functions are blue
ZSH_HIGHLIGHT_STYLES[function]='fg=blue'

# Options are red
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=red'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=red'

# Command Substitutions are yellow
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=yellow'

# Quoted text are green
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-delimiter]='fg=green'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-delimiter]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=green'

# Assignments are red
ZSH_HIGHLIGHT_STYLES[assign]='fg=red'

# Line background color
ZSH_HIGHLIGHT_STYLES[line]='bg=#2c323c'

# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'

# To have paths colored instead of underlined
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'

# To disable highlighting of globbing expressions
ZSH_HIGHLIGHT_STYLES[globbing]='fg=cyan'


# Powerlevel10k configuration
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon vi_mode context dir vcs root_indicator)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)

# Icons
# POWERLEVEL9K_LINUX_ICON=$' \uF300'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last

POWERLEVEL9K_DIR_SHOW_WRITABLE=true

# Segment Colors
POWERLEVEL9K_OS_ICON_BACKGROUND='#eeeeee'
POWERLEVEL9K_OS_ICON_FOREGROUND='#3465a4'

# POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='#282828'
POWERLEVEL9K_CONTEXT_BACKGROUND='#4B5263'
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='282828'
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND='#E06C75'
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND='282828'
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND='#E06C75'

POWERLEVEL9K_VI_MODE_FOREGROUND='#282828'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='#98C379'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='#61AFEF'
POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND='#6678DD'

POWERLEVEL9K_DIR_HOME_BACKGROUND='#C678DD'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='#C678DD'

POWERLEVEL9K_STATUS_OK_FOREGROUND='040'
POWERLEVEL9K_TIME_BACKGROUND='#ABB2BF'

# export MANPATH="/usr/local/man:$MANPATH"

# Set the XDG_CONFIG_HOME
export XDG_CONFIG_HOME=$HOME/.config

# Enable wayland display for mozilla firefox
if echo $WAYLAND_DISPLAY | grep -q "wayland-."; then
    export MOZ_ENABLE_WAYLAND=1
else
    export MOZ_ENABLE_WAYLAND=0
fi

# Set TERM variable
export TERM=xterm-256color

# Set the DISPLAY variable
export DISPLAY=:0.0

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconf="nvim ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"

# Aliases
#-----------------------------------------------#

# Meta aliases
alias dotfiles='/usr/bin/git --git-dir=/home/superap/.dotfiles --work-tree=/home/superap'
alias c='clear'
alias cls='clear && ls'
alias Syyu='sudo pacman -Syyu --color auto'
alias diff='diff --color'
alias less='less -i'

# Vim
alias v='nvim'
alias vi='nvim'
alias vimconf='nvim ~/.vimrc'

# Anaconda
alias anaconds-navigator='exec /opt/anaconda/bin/anaconda-navigator &'
alias spyder='exec /opt/anaconda/bin/spyder &'
alias conda='sudo /opt/anaconda/condabin/conda'

# Grep
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# Books
alias CLRS='zathura ~/Documents/NAALEDGE/Algorithms/Introduction_to_algorithm/Introduction-to-algorithms-3rd-edition.pdf &'
alias Eloquent_JavaScript='zathura ~/Documents/NAALEDGE/JavaScript/Eloquent_JavaScript-3rd_Edition.pdf &'
alias Fundamentals_Database='zathura ~/Documents/NAALEDGE/Database/Fundamentals_of_Database_Systems-7th_edition.pdf &'
alias HTML5_The_Missing_Manual=' zathura ~/Documents/NAALEDGE/HTML_and_CSS/HTML5-The_Missing_Manual-2nd_Edition.pdf &'
alias HTML_and_CSS='zathura ~/Documents/NAALEDGE/HTML_and_CSS/Jon_Duckett_HTML_and_CSS.pdf &'
alias CSS3_The_Missing_Manual='zathura ~/Documents/NAALEDGE/HTML_and_CSS/CSS-The-Missing-Manual-4th.pdf &'
alias Learning_Python='zathura ~/Documents/NAALEDGE/Python/LearningPython.pdf &'
alias C_Programming='zathura ~/Documents/NAALEDGE/C-C++/C_Programming_A_Modern_Approach_2nd_Ed.pdf &'
alias Practical_Vim='zathura ~/Documents/NAALEDGE/Vim/Drew\ Neil\ -\ Practical\ Vim\ Edit\ Text\ at\ the\ Speed\ of\ Thought\,\ 2nd\ Edition\ -\ 2015.pdf &'
alias Clean_Code='zathura ~/Documents/NAALEDGE/Clean_Code/Clean_Code.pdf &'

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

source $ZSH/oh-my-zsh.sh

# Custom plugins installed via pacman
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

