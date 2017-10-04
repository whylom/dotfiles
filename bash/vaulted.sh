function vaulted_prompt() {
  vault=$VAULTED_ENV
  if [ -z $vault ]; then
    echo ""
  else
    echo " vault:$vault"
  fi
}