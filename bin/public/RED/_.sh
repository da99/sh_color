
source $THIS_DIR/bin/public/COLORIZE/_.sh

# === {{CMD}}  "my text"
# === {{CMD}}  "keyword"  "my text with keyword"
# === NOTE: Prints to STDERR
RED () {
  local BRed='\e[1;31m'
  local Red='\e[0;31m'
  COLOR="BRIGHT_RED" COLORIZE "$@" 1>&2
} # === end function
