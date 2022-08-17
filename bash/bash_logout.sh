#!/usr/bin/bash

# ~/.bash_logout: executed by bash(1) when login shell exits.
# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
  command -v clear >/dev/null 2>&1 && clear
  [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
