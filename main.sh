#!/bin/bash -l

set -euo pipefail

main() {

  local FILE_PATH="$FILE_PATH";
  local CURRENT_VALUE="$CURRENT_VALUE";
  local NEW_VALUE="$NEW_VALUE";

  echo "FILE_PATH:$FILE_PATH"
    
  SAVEIFS=$IFS                      # Save current IFS (Internal Field Separator)
  IFS=$'\n'                         # Change IFS to newline char
  CURRENT_VALUES=($CURRENT_VALUE)   # split the `current_value` string into an array by the same name
  IFS=$SAVEIFS                      # Restore original IFS
  IFS=$'\n'                         # Change IFS to newline char
  NEW_VALUES=($NEW_VALUE)           # split the `new_value` string into an array by the same name
  IFS=$SAVEIFS                      # Restore original IFS 

  for (( i=0; i<${#CURRENT_VALUES[@]}; i++ ))
  do
    echo "\n"
    echo "🔍 CURRENT_VALUE: ${CURRENT_VALUES[$i]}"
    echo "🔎 NEW_VALUE: ${NEW_VALUES[$i]}"
    sed -i.back "s|${CURRENT_VALUES[$i]}|${NEW_VALUES[$i]}|g" $FILE_PATH
    echo "📝 ${CURRENT_VALUES[$i]} ➡️ ${NEW_VALUES[$i]} ✅"
  done
}

main