#!/bin/bash

##
## color constants ##
##

default_color='\033[0m'
white_color='\033[1;37m'
green_color='\033[0;32m'
red_color='\033[0;31m'
gray_color='\033[0;37m'

##
## configuration variables ##
##

declare -a exclusions=(
  '.'
  '..'
  '.git'
  '.gitmodules'
  '.gitignore'
  'link_configs.sh'
  'link_configs.sh.swp'
  '.DS_Store'
)

repo_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
home_directory="$HOME/"

##
## helper functions ##
##

prompt_for_skip() {
  while true; do
    read result
    case $result in
      [Bb]* ) echo 0; break;;
      [Ss]* ) echo 1; break;;
    esac
  done
}

##
## parse options ##
##

usage() { 
  echo "usage: check_version [-ch]" 1>&2; exit 1; 
}

while getopts ":ch" option; do
  case "${option}" in
    c) clean_links=1 ;;
    h) usage ;;
  esac
done

##
## main point of execution ##
##

for entry in * .*; do
  if [[ ${exclusions[*]} =~ $entry ]]; then # ignore any results from the exclusions array
    continue
  fi

  home_filepath=$home_directory$entry
  repo_filepath=$repo_directory$entry
  
  # if we're in clean mode, we're going to see if each item is a symlink, and if so remove it
  if [[ -n "${clean_links}" ]]; then 
    if [[ -L $home_filepath ]]; then 
      echo -e "${red_color}✗ ${white_color}removing link: ${gray_color}$home_filepath${default_color}"
      rm -r $home_filepath
    fi
    continue
  fi 
 
  # otherwise, in the normal mode we're going to check the filetype to determine which operation to perform 
  if [[ -L $home_filepath ]]; then # the file in the home dir is already a link
    echo -e "${green_color}✓ ${white_color}link exists: ${gray_color}$home_filepath${default_color}"
    continue
  elif [[ -e $home_filepath ]]; then # if the home file exists
    echo -e "${red_color}✗ ${white_color}file exists: ${gray_color}$home_filepath${white_color}. (b)ackup or (s)kip?${default_color}"
    if [[ $(prompt_for_skip) == "1" ]]; then # and if we elect to skip linking it
      continue
    else # otherwise rename the file to a backup filename
      mv -f $home_filepath "$home_filepath.bak"
    fi
  else
    echo -e "${green_color}• ${white_color}file did not exist, linking: ${gray_color}$home_filepath${default_color}"
  fi

  ln -sF $repo_filepath $home_filepath
done
