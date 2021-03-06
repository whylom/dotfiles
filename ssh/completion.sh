__ssh_hosts() {
  local list=$(grep "Host " ~/.ssh/config | grep -v "*" | sed 's/Host //g')
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __ssh_hosts ssh
complete -f -F __ssh_hosts scp
