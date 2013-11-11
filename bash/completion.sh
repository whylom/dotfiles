__ssh_hosts() {
  local list=$(cat ~/.ssh/config | grep "Host " | sed 's/Host //g')
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __ssh_hosts ssh
