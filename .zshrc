# Start configuration added by Zim Framework install {{{

# -----------------
# Zsh configuration
# -----------------

# History
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY          

# Prompt for spelling correction of commands.
setopt CORRECT
setopt AUTO_CD
setopt CORRECT_ALL

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source /usr/share/zimfw/zimfw.zsh init
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

DISABLE_AUTO_TITLE="true"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="dd/mm/yyyy"

plugins=(cp aliases vi-mode)

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

## Themed prompt
eval "$(starship init zsh)"

# Set aliases
alias lst='ls'
alias ls='exa --icons=always '
alias la='exa --icons=always -ah'
alias lla='exa --icons=always -alh'
alias ll='exa --icons=always -lh'
alias mpv='devour mpv'
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
alias fetch='clear && fastfetch'
alias x='cd "$(xplr --print-pwd-as-result)"'
alias tabletstream='scrcpy -ne --no-audio --max-fps=30 --video-codec=h264 '

# env vars
export PATH="$HOME/.local/bin:$PATH"
export PATH="$XDG_CONFIG_HOME/isomorphic-copy/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

# Defer loading NVM until you actually run node
lazy_load_nvm() {
  unset -f nvm node npm npx
  [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
  source /usr/share/nvm/init-nvm.sh
}

# stubs that trigger the lazy loader
nvm() { lazy_load_nvm; nvm "$@"; }
node() { lazy_load_nvm; node "$@"; }
npm() { lazy_load_nvm; npm "$@"; }
npx() { lazy_load_nvm; npx "$@"; }

# pfetch-rs configs 
export PF_INFO="ascii title os kernel uptime pkgs memory palette"
export PF_SEP=" 󰥱  "
export PF_COLOR=1
export PF_COL1=5 
export PF_COL2=7 

TRAPALRM() {
	declare -a commands=("cmatrix -k -M 'H E L L  Y E A H'" "pipes.sh" "cava" "cbonsai -l" "peaclock" "astroterm -s 10 -f 30 -c -C ")
	random_index=$(shuf -i 1-${#commands[@]} -n 1)
	${commands[$random_index]}
}

greeting() {
    # default to 24 if undefined.
    local term_height=${LINES:-24}

    if [[ $term_height -ge 30 ]]; then
        if command -v fastfetch &> /dev/null; then
            fastfetch
        fi
    elif [[ $term_height -ge 20 ]]; then
        if command -v krabby &> /dev/null; then
            krabby random
        fi
    else
        if command -v figlet &> /dev/null && command -v lolcat &> /dev/null; then
            figlet -f slant "Hi, ${USER}!" | lolcat
        elif command -v fastfetch &> /dev/null; then
            fastfetch -c ~/.config/fastfetch/minimal.jsonc
        fi
    fi
}

greeting

