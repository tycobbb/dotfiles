#!/bin/zsh

# export path to the zshrc
export ZSH_RC=$HOME/.zshrc
export ZSH_RCD=$HOME/.zshrc.d

# oh-my-zsh config 
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="awesomepanda"

# - plugins (sourced from: ~/.oh-my-zsh/plugins/*)
plugins=(git rails ruby rake gem osx brew yarn gitfast vi-mode)

# utility functions
function printd() {
  if [[ -n $ZSH_VERBOSE ]]; then echo $1; fi
}

function load_modules() {
  directory=$1
  if [[ -d $directory ]] && [[ -n "$(ls $directory)" ]]; then
    for dotfile in $directory/*; do
      if [[ ! -d "${dotfile}" ]] && [[ -r "${dotfile}" ]]; then
        printd "load: ${dotfile}"
        source ${dotfile}
      fi
    done
  fi
}

# load root modules
load_modules $ZSH_RCD

# bootstrap oh-my-zsh
printd "step: bootstrap oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# load late modules
load_modules $ZSH_RCD/late

# cleanup variables
unset ZSH_VERBOSE

