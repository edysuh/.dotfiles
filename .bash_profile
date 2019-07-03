# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

alias ls='ls -hFG'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

bind TAB:menu-complete
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"


# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH
export PATH="/usr/local/opt/node@8/bin:$PATH"
