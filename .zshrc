
# path to oh-my-zsh config
ZSH=$HOME/.oh-my-zsh

# theme
ZSH_THEME="gozilla" # "cloud" # "ty" # "kolo"

# plugins (sourced from: ~/.oh-my-zsh/plugins/*)
plugins=(git rails ruby rvm rake gem osx brew gitfast)

# aliases
alias zshrc='vi ~/.zshrc'
alias gitrc='vi ~/.gitconfig'
alias vimrc='vi ~/.vimrc'
alias zshreload='source ~/.zshrc'

alias ls='ls -a -G'
alias lsl='ls -l -G'
alias ps='ps -xva'

alias ssh-cc='ssh tcobb@162.248.10.45'
alias sftp-cc='sftp txcobb@162.248.10.45'
alias ssh-ec2='ssh -i ~/.ssh/tyserv.pem ubuntu@ec2-50-112-12-98.us-west-2.compute.amazonaws.com'
alias sftp-ec2='sftp -i ~/.ssh/tyserv.pem ubuntu@ec2-50-112-12-98.us-west-2.compute.amazonaws.com'

# autocompletion options
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

# path configuration
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/bin:$HOME/.rvm/bin:/usr/local/share/npm/bin

# optional paths
#   postgres dump: /Applications/Postgres.app/Contents/MacOS/bin/

# bootstrap rvm in some manner I don't understand
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# directory-based profiles

zstyle ':chpwd:profiles:~/Work/Projects/CCNetwork/Repo/CCNetworkIOS/(|/|/*)', profile ccnetwork

# configuration profiles

chpwd_profile_ccnetwork()
{
  [[ $(profile) == ${CHPWD_PROFILE} ]] && return 1
  print "chpwd(): switching to profile: $profile"
  alias yay='echo "yay"'  
}

