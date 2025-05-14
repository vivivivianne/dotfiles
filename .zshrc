# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
 HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(cp git aliases vi-mode colorize)

source $ZSH/oh-my-zsh.sh

# User configuration
MODE_INDICATOR="%F{white}+%f"
INSERT_MODE_INDICATOR="%F{yellow}+%f"
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/traveler/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Nvim wayland clipboard compatibility 

# Set aliases
alias ls='exa --icons=always '
alias la='exa --icons=always -ah'
alias lla='exa --icons=always -alh'
alias ll='exa --icons=always -lh'
alias mpv='devour mpv'
alias zathura='devour zathura '
alias cmatrix='cmatrix -M "H E L L  Y E A H"'
alias vim='grc nvim'
alias rm='trash'
alias pinfo='paru --color=auto -Q --info'
alias mirror='xrandr --output HDMI-0 --output DP-1 --same-as HDMI-0'
alias findheavy='du -cha --max-depth=1 . | grep -E "G"'
alias newsboat='newsboat -C ~/.newsboat/.config'
alias dotfiles='/usr/bin/git --git-dir="/$HOME/.cfg/" --work-tree="$HOME"'
alias lazydots='lazygit --git-dir="$HOME/.cfg/" --work-tree="$HOME"'
alias uwu='uwufetch -i ~/pfp.png'
alias paru='paru --color=auto'
alias nmap='grc nmap'
alias wtf='wtfutil'
alias s='systemctl'
alias v='nvim'
alias n='ncmpcpp'
alias ni='ncmpcpp -c ~/.config/ncmpcpp/config_alt'
# alias x='xplr'
alias ssh="kitty +kitten ssh"
alias yt-dlv="yt-dlp -x --audio-format mp3 --embed-thumbnail --add-metadata -i"
alias idavis="davis cover & davis current"
alias bgfetch='clear && neofetch'
alias fetch='clear && neofetch --ascii'
# alias ifetch="neofetch --clean && neofetch --backend kitty --source ~/Imagens/wallpaper.webp"
alias peaclock="peaclock --config-dir ~/.config/peaclock --colour=on"
alias x='cd "$(xplr --print-pwd-as-result)"'
alias drawtimer='./scripts/drawtimer.sh'
alias studytimer='./scripts/drawtimer.sh'
alias ricetimer='./scripts/drawtimer.sh'
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
# ## env vars
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_STATE_HOME=${HOME}/.local/state
export WINEPREFIX=${XDG_DATA_HOME}/wine
export ANDROID_HOME=${XDG_DATA_HOME}/android
# export HISTFILE=${XDG_STATE_HOME}/bash/history
export CARGO_HOME=${XDG_STATE_HOME}/cargo
# export CUDA_CACHE_PATH=${$XDG_CACHE_HOME}/nv
export GNUPGHOME=${XDG_DATA_HOME}/gnupg
export RUSTUP_HOME=${XDG_DATA_HOME}/rustup
export XPLR_BOOKMARK_FILE=$HOME/.config/xplr/bookmarks
export GOPATH=${XDG_DATA_HOME}/go
export QT_QPA_PLATFORMTHEME=qt5ct
export NOTES_DIR="${home}/notes/"
export PATH="$HOME/.local/bin:$PATH"
source /usr/share/nvm/init-nvm.sh


export PATH="$XDG_CONFIG_HOME/isomorphic-copy/bin:$PATH"
