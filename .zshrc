
# path to oh-my-zsh config
ZSH=$HOME/.oh-my-zsh

##
## theme
##
ZSH_THEME="kolo" # "ty"

##
## plugins (sourced from: ~/.oh-my-zsh/plugins/*) ##
##
plugins=(git rails ruby rake gem osx brew gitfast vi-mode)

##
## aliases ##
##
alias zshrc='vim ~/.zshrc'
alias gitrc='vim ~/.gitconfig'
alias vimrc='vim ~/.vimrc'
alias zshreload='source ~/.zshrc'

alias lsh='ls -a'
alias lsl='ls -l -G'
alias ps='ps -xva'

alias bower='noglob bower'
alias pg='postgres -D /usr/local/var/postgres'

alias ssh-cc='ssh tcobb@162.248.10.45'
alias sftp-cc='sftp txcobb@162.248.10.45'
alias ssh-ec2='ssh -i ~/.ssh/tyserv.pem ubuntu@ec2-50-112-12-98.us-west-2.compute.amazonaws.com'
alias sftp-ec2='sftp -i ~/.ssh/tyserv.pem ubuntu@ec2-50-112-12-98.us-west-2.compute.amazonaws.com'


##
## vi-mode ##
##
bindkey -v 
export KEYTIMEOUT=1

# Use vim cli mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

##
## autocompletion options ##
##
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

##
## path configuration ##
##
export PATH=/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/texbin:$HOME/bin:usr/local/share/npm/bin:$HOME/Dropbox/scripts/bin:$PATH

##
## GitHub tokens 
##
export HOMEBREW_GITHUB_API_TOKEN=2eaf3e44ed37a6975498b456b762d134d63c7c35

# shim for rbenv
eval "$(rbenv init - zsh)"

# bootstrap nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# added by travis gem
[ -f /Users/ty/.travis/travis.sh ] && source /Users/ty/.travis/travis.sh
