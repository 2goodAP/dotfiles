#
# ~/.zprofile
#

# Get the latest major verison of Ruby
ruby_maj_ver="$(ls $HOME/.local/share/gem/ruby | grep $(ruby -v | cut -d ' ' -f 2 | cut -d . -f 1,2))"

# Add to PATH
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.local/share/gem/ruby/$ruby_maj_ver/bin:$PATH"

# Enable native wayland for Firefox
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
else
    export MOZ_ENABLE_WAYLAND=0
fi

# Pyenv init
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"


[[ -f ~/.zshrc ]] && . ~/.zshrc
