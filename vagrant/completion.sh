__vagrant() {
  local index list cmd

  index=${#COMP_WORDS[@]}
  cmd="${COMP_WORDS[COMP_CWORD-1]}"

  if [ $index -eq 2 ]; then
    list="box destroy halt help init package plugin provision reload resume ssh ssh-config status suspend up"
  elif [ $index -eq 3 ]; then
    if [[ $cmd = "box" ]]; then
      list="add list remove repackage"
    elif [[ $cmd = "plugin" ]]; then
      list="install license list uninstall update"
    fi
  fi

  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __vagrant v
complete -F __vagrant vagrant
