__branches() {
  local list=$(git branch -a | tr -d ' *' | grep -v HEAD | sed 's|remotes/origin/||' | grep -v remotes)
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__recent_shas() {
  local list=$(git log --pretty=format:'%h' | head -100)
  COMPREPLY=($(compgen -W "${list}" -- ${COMP_WORDS[COMP_CWORD]}))
}

__git_completion() {
  local index cmd commands list

  index=${#COMP_WORDS[@]}
  cmd="${COMP_WORDS[COMP_CWORD-1]}"
  commands="add bisect branch clone fetch init mv push rebase rm"

  if [ $index -eq 2 ]; then
    list=$commands
  elif [[ $cmd = "push" ]]; then
    list="heroku origin production staging"
  elif [[ $cmd = "staging" ]]; then
    list=$(git branch -a | tr -d ' *' | grep -v HEAD | sed 's|remotes/origin/||' | grep -v remotes)
  fi

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

complete -F __git_completion git
