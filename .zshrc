# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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
# Zsh Plugins                                                                 #
#-----------------------------------------------------------------------------#
#
# Plugin Settings
# -----------------------------------------------------------------------------#
#
# zsh-history-substring-search configurations
#
# Keybinds
# Up/Down Keys
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Ctrl-P/Ctrl-N Keys for emacs mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# K/J Keys for vi mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/nix/store/b1ax4vx71q1wdnrvmdyi08r6b7s09pyx-micromamba-1.2.0/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/workerap/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/workerap/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/workerap/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/workerap/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
