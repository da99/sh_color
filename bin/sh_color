#!/usr/bin/env mksh
#
#
THE_ARGS="$@"
THIS_DIR="$(dirname "$(dirname "$0")")"

if [[ -z "$@" ]]; then
  action="watch"
else
  action=$1
  shift
fi

set -u -e -o pipefail

case $action in
  help|--help|-h)
    mksh_setup print-help $0 "$@"
    ;;

  *)

    FUNC_FILE="$THIS_DIR/bin/public/${action}/_.sh"

    if [[ -s  "$FUNC_FILE"  ]]; then

      export THIS_FILE="$FUNC_FILE"
      export THIS_FUNC="$action"
      export THIS_FUNC_DIR="$THIS_DIR/bin/public/${action}"

      source "$THIS_FILE"
      "$THIS_FUNC" "$@"
      return 0
    fi

    BIN_FILE="$THIS_DIR/bin/lib/${action}.sh"
    if [[ -s "$BIN_FILE" ]]; then
      source "$BIN_FILE"
      "$action" "$@"
      exit 0
    fi

    # === Check progs/bin:
    if [[ -f "progs/bin/$action" ]]; then
      export PATH="$PWD/progs/bin:$PATH"
      progs/bin/$action "$@"
      exit 0
    fi

    # === It's an error:
    echo "!!! Unknown action: $action" 1>&2
    exit 1
    ;;

esac
