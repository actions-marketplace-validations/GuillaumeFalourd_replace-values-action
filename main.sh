#!/bin/bash -l

set -euo pipefail

main() {

  local FILE_PATH="$FILE_PATH";
  local PROPERTY="$PROPERTY";
  local VALUE="$VALUE";

  echo "FILE_PATH:$FILE_PATH"
    
  SAVEIFS=$IFS       # Save current IFS (Internal Field Separator)
  IFS=$'\n'          # Change IFS to newline char
  KEYS=($PROPERTY)   # split the `properties` string into an array by the same name
  IFS=$SAVEIFS       # Restore original IFS
  IFS=$'\n'          # Change IFS to newline char
  VALUES=($VALUE)    # split the `properties` string into an array by the same name
  IFS=$SAVEIFS       # Restore original IFS 

  for (( i=0; i<${#KEYS[@]}; i++ ))
  do
    echo "KEY $i :${KEYS[$i]}"
    echo "VALUE $i :${VALUES[$i]}"
    sed -i.back "s|${KEYS[$i]}|${VALUES[$i]}|g" $FILE_PATH
  done
}

main