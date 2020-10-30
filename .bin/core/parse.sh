#!/bin/sh

# -- parsing --
Require() {
  if [ -z "$1" ]; then
    Usage
  fi
}
