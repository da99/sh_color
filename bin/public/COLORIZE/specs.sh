
specs () {
  local +x Color_Off='\e[0m'
  local +x Bold='\e[1m'
  local +x Reset='\e[0m'
  local +x BRed='\e[1;31m'
  local +x Red='\e[0;31m'
  local +x Green='\e[0;32m'
  local +x BGreen='\e[1;32m'
  local +x Orange='\e[0;33m'
  local +x BOrange='\e[1;33m'

  should-match-stdout "$(echo -e this is ${Bold}bold${Reset})" \
    'sh_color COLORIZE "this is BOLD{{bold}}"'

  should-match-stdout "$(echo -e this is ${BGreen}Bright Green${Reset})" \
    'sh_color COLORIZE "this is BRIGHT_GREEN{{Bright Green}}"'

  should-match-stdout "$(echo -e this is ${Orange}orange${Reset} and ${Orange}this too${Reset})" \
    'sh_color COLORIZE "this is ORANGE{{orange}} and {{this too}}"'

  should-match-stdout "$(echo -e this is ${BOrange}bright orange {curly}${Reset} and ${BOrange}this {too}${Reset})" \
    'sh_color COLORIZE "this is BRIGHT_ORANGE{{bright orange {curly}}} and {{this {too}}}"'

  COLOR="RED" should-match-stdout "$(echo -e this is ${Red}red${Reset})" \
    'sh_color COLORIZE "this is {{red}}"'


  # NOTE: Different shells handle '[' differently in subsitutions like ${VAR/$FIND/$REPLACE},
  # like MKSH.
  # Therefore, we have to check if {{[color]}} works.
  COLOR="BOLD" should-match-stdout "$(echo -e this is ${Bold}[bold]${Reset})" \
    'sh_color COLORIZE "this is {{[bold]}}"'
}
specs
