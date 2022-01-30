#
# ~/.zprofile
#

# Enable or disable native wayland for Firefox depending on DE
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
else
    export MOZ_ENABLE_WAYLAND=0
fi

# Allow qt5ct to control QT application themes
export QT_QPA_PLATFORMTHEME="qt5ct"

# Pyenv init
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
