__docker_compose() {
  local commands="build bundle config create down events exec help images kill logs pause port ps pull push restart rm run scale start stop top unpause up version"
  local services=$(cat docker-compose.yml | grep -e '^  [a-z-]*:' | sed 's/.$//')
  local list="$commands $services"
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __docker_compose dc
complete -F __docker_compose dc+
complete -F __docker_compose dc-
complete -F __docker_compose dc~
complete -F __docker_compose docker-compose
complete -F __docker_compose dlog
complete -F __docker_compose dbash
