#!/bin/sh
ask_to_run() {
  check=0
  while [ "$check" -eq 0 ]; do
    echo "$1 [y/N]"
    read yes_or_no
    if [ "$yes_or_no" = "Y" ] || [ "$yes_or_no" = "y" ]; then
      check=1
    elif [ "$yes_or_no" = "N" ] || [ "$yes_or_no" = "n" ]; then
      check=2
    fi
  done

  return $check
}

ask_to_run "Continue ?"
