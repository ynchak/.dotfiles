autoload -Uz compinit
compinit

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# gopath
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# volta varible
export VOLTA_HOME=$HOME/.volta
export PATH="$VOLTA_HOME/bin:$PATH"
# history
export HISTFILE="$HOME/.zsh_history"
# Number of events loaded into memory
export HISTSIZE=10000
export SAVEHIST=10000
# Do not save duplicate commands to history
setopt HIST_IGNORE_ALL_DUPS
# Do not find duplicate command when searching
setopt HIST_FIND_NO_DUPS

# no beep
unsetopt beep

# install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# regular plugins loaded

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting

# STARSHIP_CONFIG environment variable
export STARSHIP_CONFIG=~/.starship.toml

# run starship
eval "$(starship init zsh)"
