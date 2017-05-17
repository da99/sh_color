
# === {{CMD}}  "my string that is {{ bold }}"
# === echo {{my text}} | {{CMD}}

source $THIS_DIR/bin/public/COLORIZE/_.sh

BOLD () {
  COLOR="BOLD" COLORIZE "$@"
}



