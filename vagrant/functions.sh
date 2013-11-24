function vx() {
  ssh vagrant $@
}

function docker() {
  ssh vagrant docker $@
}

__docker() {
  local index list cmd

  index=${#COMP_WORDS[@]}
  cmd="${COMP_WORDS[COMP_CWORD-1]}"

  if [ $index -eq 2 ]; then
    list="build commit images kill ps rmi run start stop version"
  elif [ $index -eq 3 ]; then
    if [[ $cmd = "commit" || $cmd = "kill" || $cmd = "start" || $cmd = "stop" ]]; then
      list="$(docker ps -l | grep -v ID | awk '{ print $1 }')"
    fi
  fi

  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __docker docker
