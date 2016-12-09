
COLOR_TO_CODE () {
  local +x VAL=""
  case "$1" in
    Color_Off)
      VAL='\e[0m'
      ;;
    BOLD|Bold)
      VAL='\e[1m'
      ;;
    RESET|Reset)
      VAL='\e[0m'
      ;;
    BRed)
      VAL='\e[1;31m'
      ;;
    BRIGHT_RED|Bright_Red)
      VAL='\e[1;31m'
      ;;
    RED|Red)
      VAL='\e[0;31m'
      ;;
    BOLD_WHITE)
      VAL="$(tput bold)$(tput setaf 7)"
      ;;
    BOLD_WHITE_ON_GREEN)
      VAL="$(tput bold)$(tput setaf 7)$(tput setab 2)"
      ;;
    GREEN|Green)
      VAL='\e[0;32m'
      ;;
    BRIGHT_GREEN)
      VAL='\e[1;32m'
      ;;

    YELLOW)
      VAL='\e[0;33m'
      ;;

    ORANGE|Orange)
      VAL='\e[0;33m'
      ;;
    BRIGHT_ORANGE|BOrange)
      VAL='\e[1;33m'
      ;;
    *)
      echo "!!! Unknown color: $1" >&2
      exit 1
  esac
  echo -E $VAL
}

# === {{CMD}}           "my {{text}}"
# === {{CMD}}  "-n -E"  "my {{text}}"
COLORIZE () {

  if [[ "$#" -eq 2 ]]; then
    local +x ECHO_ARGS="$1"; shift
    local +x TEXT="$1"; shift
  else
    local +x TEXT="$@"
    local +x ECHO_ARGS="-e"
  fi

  local +x REPLACE=""
  local +x COLOR="${COLOR:-BOLD}"
  local +x DEFAULT_COLOR="$COLOR"
  local +x MATCH=""
  local +x NOT_A_COLOR=""

  local +x IFS=$'\n'
  for PARTIAL in $(echo "$TEXT" | grep -Po "([A-Za-z\_\-]+)?\{\{(.+?)\}\}(?!\})"); do
    NOT_A_COLOR=""
    COLOR=$(echo "$PARTIAL" | cut -d'{' -f1)
    if [[ -z "$COLOR" ]]; then
      COLOR="$DEFAULT_COLOR"
    else
      if [[ -z "$(COLOR_TO_CODE $COLOR 2>/dev/null)" ]]; then
        NOT_A_COLOR="$COLOR"
        COLOR="$DEFAULT_COLOR"
      else
        DEFAULT_COLOR="$COLOR"
      fi
    fi

    MATCH=$(echo "$PARTIAL" | cut -d'{' -f3- | rev | cut -d'}' -f3- | rev)
    REPLACE="$NOT_A_COLOR$(COLOR_TO_CODE "$COLOR" 2>/dev/null || "${DEFAULT_COLOR}")$MATCH$(COLOR_TO_CODE "RESET")"

    # NOTE: MKSH handles '[' differently in vars when using
    # subsitutions like ${VAR/$PARTIAL/$REPLACE}.
    # So we have to escape it by quoting the variables: ${VAR/"$PARTIAL"/"$REPLACE"}
    TEXT="${TEXT//"$PARTIAL"/"$REPLACE"}"
  done

  echo $ECHO_ARGS "$TEXT"

} # === end function

