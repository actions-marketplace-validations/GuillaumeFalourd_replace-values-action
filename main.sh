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
    echo "PARAM: " ${PARAMETERS_VALUES[$i]}
    IFS='::' read -r -a array <<< "${PARAMETERS_VALUES[$i]}"
    echo ${VALUES[0]}
    echo ${VALUES[1]}
    echo ${VALUES[2]}
    CURRENT_VALUE=${VALUES[0]}
    NEW_VALUE=$(echo ${VALUES[2]} | sed 's/$//;s/\n//')
    echo "🔍 CURRENT_VALUE: $CURRENT_VALUE"
    echo "🔎 NEW_VALUE: $NEW_VALUE"
    sed -i.back "s|$CURRENT_VALUE|$NEW_VALUE|g" $FILE_PATH
    echo "✅ CURRENT_VALUE replaced by NEW_VALUE"
  done
}

main