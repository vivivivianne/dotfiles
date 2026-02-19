# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"

plugins=(cp aliases vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
MODE_INDICATOR="%F{white}+%f"
INSERT_MODE_INDICATOR="%F{yellow}+%f"
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY

setopt autocd extendedglob
bindkey -v

# Load completion
autoload -Uz compinit; compinit

## Themed prompt
eval "$(starship init zsh)"

# Set aliases
alias lst='ls'
alias ls='exa --icons=always '
alias la='exa --icons=always -ah'
alias lla='exa --icons=always -alh'
alias ll='exa --icons=always -lh'
alias mpv='devour mpv'
alias zathura='devour zathura '
alias cmatrix='cmatrix -k -M "H E L L  Y E A H"'
alias rm='trash'
alias pinfo='paru --color=auto -Q --info'
alias findheavy='ncdu'
alias dotfiles='/usr/bin/git --git-dir="/$HOME/.cfg/" --work-tree="$HOME"'
alias lazydots='lazygit --git-dir="$HOME/.cfg/" --work-tree="$HOME"'
alias nmap='grc nmap'
alias s='systemctl'
alias v='nvim'
alias n='rmpc'
alias wifi='impala'
alias ssh="kitty +kitten ssh"
alias yt-dlv="yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata -i"
alias bgfetch='clear && neofetch --backend kitty --source ~/.config/Wallpapers/current.png'
alias fetch='clear && neofetch --ascii'
alias x='cd "$(xplr --print-pwd-as-result)"'
alias esp=". /opt/esp-idf/export.sh"
alias tabletstream='scrcpy -ne  --no-audio --max-size=1920 --max-fps=30 --video-codec=h265 --video-encoder='OMX.qcom.video.encoder.hevc.cq''

# colors in less
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
# export TERM='xterm-color'; 

# env vars
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state
export ANDROID_HOME=${XDG_DATA_HOME}/android
export CARGO_HOME=${XDG_STATE_HOME}/cargo
export GNUPGHOME=${XDG_DATA_HOME}/gnupg
export RUSTUP_HOME=${XDG_DATA_HOME}/rustup
export XPLR_BOOKMARK_FILE=$HOME/.config/xplr/bookmarks
export GOPATH=${XDG_DATA_HOME}/go
source /usr/share/nvm/init-nvm.sh
export PATH="$HOME/.local/bin:$PATH"
export PATH="$XDG_CONFIG_HOME/isomorphic-copy/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

TRAPALRM() {
	declare -a commands=("cmatrix -k -M 'H E L L  Y E A H'" "pipes.sh" "cava" "cbonsai -l" "peaclock" "astroterm -s 10 -f 30 -c -C ")
	random_index=$(shuf -i 1-${#commands[@]} -n 1)
	${commands[$random_index]}
}

if (( RANDOM % 2 )); then pfetch; else krabby random; fi

