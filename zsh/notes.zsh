#!/bin/sh

notes() {
  if [ ! -z "$1" ]; then
    echo $(date +"%d%m%Y-%H%M%S") $@  >> $HOME/notes.md
  else
    echo $(date +"%d%m%Y-%H%M%S") "$(cat)"  >> $HOME/notes.md
  fi
}
