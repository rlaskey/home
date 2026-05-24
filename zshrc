## in $HOME/.zshrc
# source $HOME/path/to/this/file

__DIR__=$(dirname $0)
source "${__DIR__}/shrc"

setopt -g HIST_SAVE_NO_DUPS
export HISTORY_IGNORE=$(IFS=\|; echo "(${HISTIGNORE_PATTERNS[*]})")

export DISABLE_ZSH_SESSIONS=1 # macOS

PROMPT='%D{%d %H:%M} %~ %# '

fzf --version >/dev/null 2>&1 && eval "$(fzf --zsh)"
