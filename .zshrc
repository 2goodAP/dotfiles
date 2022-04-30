#-----------------------------------------------------------------------------#
# Custom Configurations                                                       #
#-----------------------------------------------------------------------------#
#
# Enable vi mode
set -o vi


#-----------------------------------------------------------------------------#
# Scripts                                                                     #
#-----------------------------------------------------------------------------#
#


#-----------------------------------------------------------------------------#
# Environment Variables                                                       #
#-----------------------------------------------------------------------------#
#
# ZSH syntax highlighting configurations
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Set the XDG_CONFIG_HOME
export XDG_CONFIG_HOME=$HOME/.config

# Compilation flags
export ARCHFLAGS="-arch x86_64"

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

# Grep
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

# Sed
alias sed='sed -E'


#-----------------------------------------------------------------------------#
# Init Shell Utilities                                                        #
#-----------------------------------------------------------------------------#
#
# Conda initialize
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Pyenv init
eval "$(pyenv init -)"


#-----------------------------------------------------------------------------#
# Zsh Plugins                                                                 #
#-----------------------------------------------------------------------------#
#
# Starship
eval "$(starship init zsh)"

# Package Manager installed convenience plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
