#!/bin/sh

# -- colors --
nc="\033[0m"
wh="\033[1;37m"
ge="\033[0;32m"
rd="\033[0;31m"
ga="\033[0;90m"

# -- styles --
ul="\033[0;4m"

# -- basic --
# print
pp() {
  printf "%s" "$1"
}

# print line
pl() {
  printf "${2}%s${nc}\n" "$1"
}

# -- elements --
# print title
pt() {
  printf "${ul}${wh}%s${nc}\n" "$1"
}

# print info
pi() {
  printf "${wh}- ${nc}%s\n" "$1"
}

# print error
pe() {
  printf "${rd}✗ ${nc}%s\n" "$1"
}

# print fatal error (quit)
pf() {
  printf "${rd}✗ ${nc}%s\n" "$2"
  exit "$1"
}

# print success
ps() {
  printf "${ge}✓ ${nc}%s\n" "$1"
}

# -- style --
sr() {
  printf "%b" "${nc}"
}

sw() {
  printf "%b" "${wh}"
}

sg() {
  printf "%b" "${ga}"
}
