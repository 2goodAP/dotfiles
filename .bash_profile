#
# ~/.bash_profile
#

# Enable or disable native wayland for Firefox depending on DE
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export QT_QPA_PLATFORM=wayland
else
    export MOZ_ENABLE_WAYLAND=0
    export QT_QPA_PLATFORM=xcb
fi

# Allow qt5ct to control QT application themes
export QT_QPA_PLATFORMTHEME="qt5ct"

# Pyenv init
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"

[[ -f ~/.bashrc ]] && . ~/.bashrc
