#!/bin/zsh

## paths to zsh configs
ZSH=$HOME/.oh-my-zsh
ZSH_RC=$HOME/.zshrc
ZSH_RCD=$HOME/.zshrc.d

## theme
ZSH_THEME="awesomepanda"

## plugins (sourced from: ~/.oh-my-zsh/plugins/*)
plugins=(git rails ruby rake gem osx brew yarn gitfast vi-mode)

## utility functions
function rezsh() {
  if [[ $1 == "-v" ]]; then ZSH_VERBOSE=$1 fi
  source $ZSH_RC
}

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

function list_modules() {
  find $1/* -depth 0 -type f | sed -e "s|^$ZSH_RCD/||"
}

function zshrc() {
  if [[ "$1" == "-h" ]]; then
    echo "usage: zshrc [-h] [list|<module>]"
  elif [[ "$1" == "list" ]]; then
    list_modules $ZSH_RCD
    list_modules $ZSH_RCD/post
  elif [[ -z "$1" ]]; then
    vim $ZSH_RC
  elif [[ -f $ZSH_RCD/$1 ]]; then
    vim $ZSH_RCD/$1
  else
    echo "$1 is not a known module."
  fi
}

## load root modules
load_modules $ZSH_RCD

## bootstrap oh-my-zsh
printd "step: bootstrap oh-my-zsh"
source $ZSH/oh-my-zsh.sh

## load post modules
load_modules $ZSH_RCD/post

## cleaup variables
unset ZSH_VERBOSE

# added by travis gem
[ -f /Users/ty/.travis/travis.sh ] && source /Users/ty/.travis/travis.sh
