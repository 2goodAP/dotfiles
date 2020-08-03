#
# ~/.bash_profile
#

# Enable or disable native wayland for Firefox depending on DE
if echo $WAYLAND_DISPLAY | grep -Pq 'wayland-\d*'; then
    export MOZ_ENABLE_WAYLAND=1
else
    export MOZ_ENABLE_WAYLAND=0
fi

# For consistent theme in root KDE applications
export XDG_CURRENT_DESKTOP='KDE'

[[ -f ~/.bashrc ]] && . ~/.bashrc
