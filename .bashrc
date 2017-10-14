# .bashrc

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# aliases 
alias ls='ls -hFG'
alias l='ls'
alias sl='ls'
alias ll='ls -l'
alias la='ls -A'
alias lal='ls -Al'
# alias C='clear'

alias bashrc='nvim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias nvimit='nvim ~/.config/nvim/init.vim'
alias nvinit='nvim ~/.config/nvim/init.vim'

# show all tab completion options, case-insensitive
bind TAB:menu-complete
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"

# set editor
export EDITOR="nvim"
export VISUAL="nvim"

# git info in input line
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# fzf key bindings
source ~/.fzf.bash

# go export
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# racket export
export PATH=$PATH:/Applications/Racket\ v6.10.0.3/bin

# terminal input line
export PS1=" \[\033[32m\]\u@\h\[\033[33m\] \[\033[36m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
# export PS1=" \[\033[34m\]\D{%D %r} \[\033[32m\]\u@\h\[\033[33m\] \[\033[36m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
