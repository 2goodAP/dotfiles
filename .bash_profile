#
# ~/.bash_profile
#

# Enable or disable native wayland for Firefox depending on DE
if echo $WAYLAND_DISPLAY | grep -Pq 'wayland-\d*'; then
    export MOZ_ENABLE_WAYLAND=1
else
    export MOZ_ENABLE_WAYLAND=0
fi

# Use qt5ct to configure qt5 theme settings
export QT_QPA_PLATFORMTHEME="qt5ct"

[[ -f ~/.bashrc ]] && . ~/.bashrc
