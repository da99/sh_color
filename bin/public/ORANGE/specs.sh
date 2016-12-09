
specs () {
  local +x RESET='\e[0m'
  local +x BORANGE='\e[1;33m'

  should-match-stderr "$(echo -e my string that is ${BORANGE} orange ${RESET})" \
    'sh_color ORANGE  "my string that is {{ orange }}"'

  should-match-stderr "$(echo -e this is also orange: ${BORANGE}my {text}${RESET})" \
    'sh_color ORANGE  "this is also orange: {{my {text}}}"'

  should-match-stderr "$(echo -e this is also orange: ${BORANGE}my {text}${RESET} and ${BORANGE}this${RESET})" \
    'sh_color ORANGE  "this is also orange: {{my {text}}} and {{this}}"'
}
specs
