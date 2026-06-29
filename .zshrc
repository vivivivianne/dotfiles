# Start configuration added by Zim Framework install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

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
alias fetch='clear && fastfetch'
alias x='cd "$(xplr --print-pwd-as-result)"'
alias esp="source ~/.espressif/tools/activate_idf_v6.0.1.sh"
alias tabletstream='scrcpy -ne --no-audio --max-fps=30 --video-codec=h264 '

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

