#!/bin/bash -l

set -euo pipefail

main() {

  local FILE_PATH="$FILE_PATH";
  local PARAMETERS="$PARAMETERS";

  echo "FILE_PATH:$FILE_PATH"
    
  SAVEIFS=$IFS                      # Save current IFS (Internal Field Separator)
  IFS=$'\n'                         # Change IFS to newline char
  PARAMETERS_VALUES=($PARAMETERS)   # split the `parameters` string into an array by the same name
  IFS=$SAVEIFS                      # Restore original IFS

  for (( i=0; i<${#PARAMETERS_VALUES[@]}; i++ ))
  do
    echo ""
    echo "PARAMETERS_VALUES: " ${PARAMETERS_VALUES[$i]}
    readarray -d :: -t VALUES <<< "${PARAMETERS_VALUES[$i]}"
    echo "VALUES: " $VALUES
    declare -p VALUES  
    echo "🔍 CURRENT_VALUE: ${VALUES[0]}"
    echo "🔎 NEW_VALUE: ${VALUES[1]}"
    sed -i.back "s|${VALUES[0]}|${VALUES[1]}|g" $FILE_PATH
    echo "✅ CURRENT_VALUE replaced by NEW_VALUE"
  done
}

main