#!/bin/bash
# Activates a venv if found at ../.$PWD

function autovenv() {
  cd $@

  here=`pwd`
  name=`basename $here`
  venv="../.$name-venv"
  if [ -d $venv ]; then
    echo "Activating $venv"
    source $venv/bin/activate;
  elif [ ! -z $VIRTUAL_ENV ]; then
    deactivate
  fi
}
