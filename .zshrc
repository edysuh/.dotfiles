# Path to your oh-my-zsh installation.
export ZSH="/Users/edys/.oh-my-zsh"

# plugins
plugins=(
	git
	vi-mode
	nvm
	zsh-syntax-highlighting
)

# ?
source $ZSH/oh-my-zsh.sh

# histfile settings
HISTFILE=~/.histfile
HISTSIZE=999999999
SAVEHIST=999999999

# cd without cd
setopt autocd

# disable beep
unsetopt beep

# fix Hyper first line percent sign
unsetopt PROMPT_SP

# vi mode
bindkey -v

# faster vi mode
export KEYTIMEOUT=0

# The following lines were added by compinstall, for zsh-completions
zstyle :compinstall filename '/Users/edys/.zshrc'
autoload -Uz compinit
compinit

# complete first on tab completion
setopt menu_complete

# auto ls on cd
chpwd() {
	ls
}

# custom prompt
export PROMPT='%D{%L:%M:%S%PM} $ '

# aliases
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'

alias vim='nvim'
export EDITOR=vim
export VISUAL=vim

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.config/nvim/init.vim'
alias hyperjs='vim ~/.hyper.js'

# fzf keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
# --no-ignore

# ruby path
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# nvm setup
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This lo ads nvm bash_completion

# python3 symlinks as default
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# llvm path
export PATH="/usr/local/opt/llvm/bin:$PATH"
