
# === {{CMD}}  RED|GREEN|YELLOW|BLUE|PURPLE|CYAN  "string string"
color () {
    color_name=$1
    shift
    case "$color_name" in
      "RED" )
        color=1
        ;;
      "GREEN" )
        color=2
        ;;
      "YELLOW" )
        color=3
        ;;
      "BLUE" )
        color=4
        ;;
      "PURPLE" )
        color=5
        ;;
      "CYAN" )
        color=6
        ;;
      * )
        color=7
        ;;
    esac

    # From: stackoverflow.com/questions/635361/ksh-how-to-probe-stdin
    if [ -t 0 ]
    then
      echo -e "$(tput bold)$(tput setaf $color)$@$(tput sgr0)";
    else
      while read line; do
        echo -e "$(tput bold)$(tput setaf $color)${line}$(tput sgr0)";
      done
    fi
} # === end function
