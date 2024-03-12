# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh/

ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_CUSTOM=~/.oh-my-zsh/

plugins=(git)

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

export EDITOR='nvim'
export VISUAL='nvim'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

# reporting tools - install when not installed
#neofetch
#screenfetch
#alsi
#paleofetch
#fetch
#hfetch
#sfetch
#ufetch
#ufetch-arco
#pfetch
#sysinfo
#sysinfo-retro
#cpufetch
#colorscript random
#hyfetch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias lite="NVIM_APPNAME=Litevim nvim"
alias lff="ranger"
alias vim="neovide . && exit"

alias ls='exa --icons --color=always --group-directories-first'
alias ll='exa -alF --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias l='exa -F --icons --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

alias tt="tt -theme catppuccin -t 15 -n 10"

alias ga="git add"
alias gc="git commit -m "
alias gp="git push"
alias gitc="git clone"
alias gitcb="git clone --single-branch --branch"

alias list-gens="sudo nix-env --list-generations --profile /nix/var/nix/profiles/system"
alias delete-gen="sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations"
alias rebuild="sudo nixos-rebuild switch"
alias config="sudo -e /etc/nixos/configuration.nix"
alias configfmt="sudo nixfmt /etc/nixos/configuration.nix"

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

# Neovim
export EDITOR="nvim"
export VISUAL="nvim"

# Grim
export GRIM_DEFAULT_DIR=/home/srinath/Pictures/

# Firefox
export MOZ_ENABLE_WAYLAND=1

# Gtk theme
export GTK_THEME=Catppuccin-Mocha-B

# Local bin 
export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# Node js 
export NODE_PATH=~/.npm-packages/lib/node_modules
export PATH=~/.npm-packages/bin:$PATH

export AGS_SKIP_V_CHECK=true ags
export ANDROID_HOME=/home/srinath/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
source ~/powerlevel10k/powerlevel10k.zsh-theme
