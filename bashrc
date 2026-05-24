## in $HOME/.bashrc
# source $HOME/path/to/this/file

__DIR__=$(dirname $BASH_SOURCE[0])
source "${__DIR__}/shrc"

export HISTCONTROL='ignoreboth:erasedups'
export HISTIGNORE=$(IFS=:; echo "${HISTIGNORE_PATTERNS[*]}")

PS1='\D{%d %H:%M} \W \$ '

fzf --version >/dev/null 2>&1 && eval "$(fzf --bash)"
