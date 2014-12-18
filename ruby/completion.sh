__heroku() {
  local index list cmd

  index=${#COMP_WORDS[@]}
  cmd="${COMP_WORDS[COMP_CWORD-1]}"

  if [ $index -eq 2 ]; then
    list="addons apps auth authorizations config domains logs ps releases run sharing account certs drains fork git help keys labs maintenance members orgs pg pgbackups plugins regions stack status update version"
  elif [[ $cmd = "help" ]]; then
    list="addons apps auth authorizations config domains logs ps releases run sharing account certs drains fork git help keys labs maintenance members orgs pg pgbackups plugins regions stack status update version"
  elif [[ $cmd = "-a" ]]; then
    list=$HEROKU_APPS # defined in private.sh
  fi

  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__bundle() {
  local list="check exec install"
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__rvm() {
  local list="current gemset info install list rubies uninstall version"
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __bundle bundle
complete -F __heroku heroku
complete -F __heroku h
complete -F __heroku h?
complete -F __rvm rvm
