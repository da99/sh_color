
# === {{CMD}}  "my string that is {{ bold }}"

source $THIS_DIR/bin/public/COLORIZE/_.sh

BOLD () {
  COLOR="BOLD" COLORIZE "$@"
}



