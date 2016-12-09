
# === {{CMD}}  "my string that is {{ orange }}"
# === Outputs to Standard Error.

source $THIS_DIR/bin/public/COLORIZE/_.sh

ORANGE () {
  COLOR="BRIGHT_ORANGE" COLORIZE "$@" >&2
}



