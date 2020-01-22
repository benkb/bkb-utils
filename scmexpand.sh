#!/bin/sh

inp=$1

[ -n "$inp" ] || { echo "usage:<file input>"; exit 1; }

guile --no-auto-compile ./macroexpand.scm "$inp" 
