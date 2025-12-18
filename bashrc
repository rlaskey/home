export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE='ls*:cd*:echo*:cat*:[bf]g:ps*:top*:curl*:vim*'
export EDITOR=vim
PS1='\D{%d %H:%M} \W \$ '

# ssh-agent
export SSH_AUTH_SOCK=$HOME/.ssh/agent
if [ ! -S $SSH_AUTH_SOCK ] || [ $(ssh-add -l >/dev/null 2>&1; echo $?) = 2 ]; then
	# echo 'NOTE: starting a new SSH agent.'
	killall -u $USER ssh-agent 2>/dev/null
	ssh-agent -a $SSH_AUTH_SOCK > /dev/null
fi


export FZF_DEFAULT_COMMAND='rg --files'
fzf --version >/dev/null 2>&1 && eval "$(fzf --bash)"

# git clone https://github.com/junegunn/fzf-git.sh.git $HOME/.fzf-git
dest=$HOME/.fzf-git/fzf-git.sh; [ -f $dest ] && source $dest; unset dest
