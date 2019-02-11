#!/bin/zsh

# export path to the zshrc
export ZSH_RC=$HOME/.zshrc
export ZSH_RCD=$HOME/.zshrc.d

# oh-my-zsh config 
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="awesomepanda"

# - plugins (sourced from: ~/.oh-my-zsh/plugins/*)
plugins=(osx vi-mode brew git gitfast rails ruby rake gem yarn rust cargo)

# cosmetics
rs="\033[0m"
gr="\033[0;90m"
gn="\033[1;32m"
yl="\033[1;33m"

# utility functions
function printd() {
  if [[ -n $ZSH_VERBOSE ]]; then echo $1; fi
}

function load_modules() {
  directory=$1
  if [[ -d $directory ]] && [[ -n "$(ls $directory)" ]]; then
    for dotfile in $directory/*; do
      if [[ ! -d "${dotfile}" ]] && [[ -r "${dotfile}" ]]; then
        printd "${gr}• load: ${dotfile}${rs}"
        source ${dotfile}
      fi
    done
  fi
}

# load pre/normal modules
load_modules $ZSH_RCD/pre
load_modules $ZSH_RCD

# bootstrap oh-my-zsh
printd "➜ step: bootstrap oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# load post modules
load_modules $ZSH_RCD/post

# echo final path
printd "✔ path: $PATH"
printd "${yl}⭑ ${gn}done!${rs}"

# cleanup variables
unset ZSH_VERBOSE

