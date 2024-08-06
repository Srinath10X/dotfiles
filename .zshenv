# ------------------------------- #
# --------->  Exports  <--------- #
# ------------------------------- #

# Wayland
export QT_QPA_PLATFORM=wayland
export MOZ_ENABLE_WAYLAND=1

# Android Studio ENV's
export ANDROID_HOME=/home/srinath/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Basic environment settings
export USER="srinath"
export HOSTNAME="archlinux"
export SHELL="zsh"

# Customize pfetch information display
export PF_INFO="ascii title os host pkgs shell memory"

# prefered editor
export EDITOR="nvim" 
export VISUAL="nvim"

# Add local bin directories to PATH
export PATH=$HOME/.local/bin:$HOME/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# Node js 
export NODE_PATH=~/.npm-packages/lib/node_modules
export PATH=~/.npm-packages/bin:$PATH

# Ags
export AGS_SKIP_V_CHECK=true ags

# Grim
export GRIM_DEFAULT_DIR=$HOME/Pictures/screenshorts/

# fzf default options
export FZF_DEFAULT_OPTS='--prompt=" 󰍉 Search " --height=~100% --layout=reverse --border --pointer="󰁕" --no-scrollbar  --exit-0'

# ytfzf
export  YTFZF_PREF='22'    

# LF_ICONS
export LF_ICONS="\
tw=󰉋:\
st=󰉋:\
ow=󰉋:\
dt=󰉋:\
di=󰉋:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
