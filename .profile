#
# ~/.profile
#

# Enable or disable native wayland for Firefox depending on DE
if echo $WAYLAND_DISPLAY | grep -Pq 'wayland-\d*'; then
    export MOZ_ENABLE_WAYLAND=1
else
    export MOZ_ENABLE_WAYLAND=0
fi

# For consistent theme in root KDE applications
export XDG_CURRENT_DESKTOP='KDE'

PATH="/usr/sbin:/sbin:/bin:/usr/games:$PATH"

# Pyenv init
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init --path)"
