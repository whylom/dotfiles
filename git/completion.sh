__branches() {
  local list=$(git branch -a | tr -d ' *' | grep -v HEAD | sed 's|remotes/origin/||' | grep -v remotes)
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__recent_shas() {
  local list=$(git log --pretty=format:'%h' | head -100)
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

complete -F __branches gbd
complete -F __branches gco
complete -F __branches gcob
complete -F __branches gd
complete -F __branches gm
complete -F __branches gp
complete -F __branches gpu
complete -F __recent_shas gsho
