# ------------------------------- #
# --------->  Exports  <--------- #
# ------------------------------- #

# Wayland
export QT_QPA_PLATFORM="wayland;xcb"
export QT_PLUGIN_PATH=/usr/lib/qt/plugins/

# Firefox
export MOZ_USE_XINPUT2=1
export MOZ_ENABLE_WAYLAND=1

# SSH related env's
export TERM=xterm-256color
export TERMINFO=/usr/share/terminfo

# Android Studio ENV's
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_NDK_ROOT=$HOME/Android/Sdk/ndk

# Android Studio PATH'S
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# Nix
export NIXPKGS_ALLOW_UNFREE=1
export PATH=$HOME/.nix-profile/bin:$PATH

# Set your prefered editor of your choice
export EDITOR="nvim"
export VISUAL="nvim"

# Add local bin directories to PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$HOME/bin:$PATH
export PATH=$HOME/development/flutter/bin:$PATH
export PATH=$HOME/.local/.npm-packages/bin:$PATH

# Node js
export NVM_DIR="$HOME/.nvm"
export NODE_PATH=~/.npm-packages/lib/node_modules

# Ags
export AGS_SKIP_V_CHECK=true ags

# Grim
export GRIM_DEFAULT_DIR=$HOME/Pictures/screenshorts/

# fzf default options
export FZF_DEFAULT_OPTS='--prompt=" 󰍉 Search " --height=~100% --layout=reverse --border --pointer="󰁕" --no-scrollbar  --exit-0'

# ytfzf
export YTFZF_PREF='22'

# pkgconfig path
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:$PKG_CONFIG_PATH
