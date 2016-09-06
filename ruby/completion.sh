__bundle() {
  local list="check exec install"
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__envs() {
  local list="development staging production"
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__rbenv() {
  local list=$(rbenv help | grep '^   ' | awk '{ print $1 }')
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __bundle bundle

complete -F __envs hl
complete -F __envs c!
complete -F __envs h!
complete -F __envs db!
complete -F __envs rdbm!

complete -F __rbenv rbenv
