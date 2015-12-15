#!/bin/zsh

## path to oh-my-zsh config
ZSH=$HOME/.oh-my-zsh

## theme
ZSH_THEME="kolo" # "ty"

## plugins (sourced from: ~/.oh-my-zsh/plugins/*) ##
plugins=(git rails ruby rake gem osx brew gitfast vi-mode)

## utility functions
function rezsh() {
  if [[ $1 == "-v" ]]; then ZSHRC_VERBOSE=$1 fi
  source ~/.zshrc
}

function printd() {
  if [[ -n $ZSHRC_VERBOSE ]]; then echo $1; fi
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

## load root modules
load_modules ~/.zshrc.d

## bootstrap oh-my-zsh
printd "step: bootstrap oh-my-zsh"
source $ZSH/oh-my-zsh.sh

## path configuration ##
printd "step: update path"
export PATH=/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/texbin:$HOME/bin:usr/local/share/npm/bin:$HOME/Dropbox/scripts/bin:$PATH

## load post modules
load_modules ~/.zshrc.d/post

## cleaup flags 
unset ZSHRC_VERBOSE
