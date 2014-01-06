__heroku() {
  local list="addons apps auth config domains logs ps releases run sharing account certs drains fork git help keys labs maintenance members orgs pg pgbackups plugins regions stack status update version"
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

complete -F __heroku heroku
complete -F __bundle bundle
complete -F __rvm rvm
