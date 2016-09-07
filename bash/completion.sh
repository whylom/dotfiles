__ssh_hosts() {
  local list=$(grep "Host " ~/.ssh/config | grep -v "*" | sed 's/Host //g')
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __ssh_hosts ssh

__homebrew() {
  local index cmd commands list

  index=${#COMP_WORDS[@]}
  cmd="${COMP_WORDS[COMP_CWORD-1]}"

  if [[ $cmd = "brew" ]]; then
    list="bundle cask cleanup doctor home info install list search tap uninstall update upgrade"
  elif [[ $cmd = "cask" ]]; then
    list="cleanup doctor home info install list search uninstall update zap"
  elif [ $index -eq 3 ]; then
    list=$(brew list)
  elif [ $index -eq 4 ]; then
    list=$(brew cask list)
  fi

  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __homebrew brew
