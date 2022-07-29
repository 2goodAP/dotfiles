#
# ~/.zprofile
#

# Modify PATH
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Enable native wayland for Firefox
if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    export MOZ_ENABLE_WAYLAND=1
else
    export MOZ_ENABLE_WAYLAND=0
fi

# Use qt5ct for applying themes to QT applications.
export QT_QPA_PLATFORMTHEME=qt5ct


[[ -f ~/.zshrc ]] && . ~/.zshrc
