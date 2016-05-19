__ssh_hosts() {
  local list=$(grep "Host " ~/.ssh/config | grep -v "*" | sed 's/Host //g')
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __ssh_hosts ssh


__homebrew_apps=$(brew list)
__homebrew() {
  local index cmd commands list

  index=${#COMP_WORDS[@]}
  cmd="${COMP_WORDS[COMP_CWORD-1]}"
  commands="create doctor edit home info install list options pin search uninstall unpin update upgrade"

  if [ $index -eq 2 ]; then
    list=$commands
  elif [ $index -eq 3 ]; then
    list=$(brew list)
  fi

  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __homebrew brew
