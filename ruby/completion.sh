__heroku() {
  local index cmd commands list

  index=${#COMP_WORDS[@]}
  cmd="${COMP_WORDS[COMP_CWORD-1]}"
  commands="addons apps auth authorizations config domains logs ps releases run sharing account certs drains fork git help keys labs maintenance members orgs pg pgbackups plugins regions stack status update version"

  if [ $index -eq 2 ]; then
    list=$commands
  elif [[ $cmd = "help" ]]; then
    list=$commands
  elif [[ $cmd = "run" ]]; then
    list="console"
  elif [[ $cmd = "-r" ]]; then
    list="development staging production"
  elif [[ $cmd = "-a" ]]; then
    list=$HEROKU_APPS # defined in private.sh
  fi

  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__bundle() {
  local list="check exec install"
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__rbenv() {
  local list=$(rbenv help | grep '^   ' | awk '{ print $1 }')
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__envs() {
  local list="development staging production"
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __bundle bundle
complete -F __heroku heroku
complete -F __heroku h
complete -F __heroku hc
complete -F __heroku hc!
complete -F __heroku h?
complete -F __heroku h!
complete -F __envs hl
complete -F __envs c!
complete -F __envs h!
complete -F __envs db!
complete -F __envs rdbm!
complete -F __rbenv rbenv
