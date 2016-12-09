

specs () {
  local +x RESET='\e[0m'
  local +x GREEN='\e[1;32m' # Bright/Bold Green
  local +x RED='\e[1;31m'   # Bright/Bold REd

  should-match-stdout "$(echo -e "=== ${GREEN}colored${RESET}: specs")" \
    'sh_color GREEN "=== {{colored}}: specs"'

  should-match-stdout "$(echo -e === ${GREEN}colored${RESET}dddd: specs)" \
    'sh_color GREEN "=== {{colored}}dddd: specs"'

  should-match-stdout "$(echo -e === my${GREEN}colored${RESET}dddd: specs)" \
    'sh_color GREEN "=== my{{colored}}dddd: specs"'

  should-match-stdout "$(echo -e === ${GREEN}COLOR${RESET}: specs)" \
    'sh_color GREEN "=== {{COLOR}}: specs"'

  should-match-stdout "$(echo -e === ${GREEN}GGGGREATT${RESET}: specs)" \
    'sh_color GREEN "=== {{GGGGREATT}}: specs"'

  should-match-stdout "$(echo -e === ${GREEN}colored${RESET}: ${RED}specs${RESET})" \
    'sh_color GREEN "=== {{colored}}: BRIGHT_RED{{specs}}"'
}

specs
