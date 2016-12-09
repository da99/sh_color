
# === {{CMD}}  " this is {{yellow}}"
# === {{CMD}}  " this is all yellow "
source $THIS_DIR/bin/public/COLORIZE/_.sh
YELLOW () {
  if [[ "$@" != *'{{'* ]] ; then
    COLOR="YELLOW" COLORIZE "{{$@}}"
  else
    COLOR="YELLOW" COLORIZE "$@"
  fi
} # === end function
