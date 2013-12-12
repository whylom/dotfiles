__branches() {
  local list=$(git branch -a | tr -d ' *' | grep origin | grep -v HEAD | sed 's|remotes/origin/||')
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __branches gbd
complete -F __branches gco
complete -F __branches gcob
complete -F __branches gd
complete -F __branches gm
complete -F __branches gp
complete -F __branches gpu
