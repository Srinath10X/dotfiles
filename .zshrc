# -------------------------------- #
# ------->  ZSH Config's  <------- #
# -------------------------------- #

# zsh_theme
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

# zsh_history
HISTFILE=$HOME/.zsh_history
HISTSIZE=20000
SAVEHIST=$HISTSIZE
HISTDUP=erase

# history opts
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# --------------------------------- #
# ---------->  Scripts <----------- #
# --------------------------------- #

# ex = EXtractor for all kinds of archives
ex () {
  if [ -f "$1" ]; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *.deb)       ar x "$1"      ;;
      *.tar.xz)    tar xf "$1"    ;;
      *.tar.zst)   tar xf "$1"    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# -------------------------------- #
# --------->  aliases  <---------- #
# -------------------------------- #

# list files
alias ls='exa --icons --color=always --group-directories-first'
alias ll='exa -alF --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias l='exa -F --icons --color=always --group-directories-first'
alias l.='exa -a | egrep "^\."'

# git related
alias ga="git add"
alias gc="git commit -m "
alias gp="git push"
alias gitc="git clone"
alias gitcb="git clone --single-branch --branch"

# shutdown & reboot
alias sd="shutdown now"
alias rb="reboot"

# YouTube-dl aliases for audio and video downloads
alias yta-aac="yt-dlp --extract-audio --audio-format aac"
alias yta-best="yt-dlp --extract-audio --audio-format best"
alias yta-flac="yt-dlp --extract-audio --audio-format flac"
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3"
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"

# zoxide
eval "$(zoxide init zsh)"
alias cd="z"

alias packs="nvim ~/.config/confix/packages.json"
alias lazy="NVIM_APPNAME=Lazyvim nvim"

# nix
alias nix-shell="nix-shell --run $SHELL"

# -------------------------------- #
# --------->  Sources  <---------- #
# -------------------------------- #
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"
