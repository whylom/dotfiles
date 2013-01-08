__branches() {
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    branches=$(git branch | tr -d '*' | strp | inline)
    COMPREPLY=($(compgen -W "${branches}" -- ${cur}))
    return 0
}

complete -o default -o nospace -F __branches gbd
complete -o default -o nospace -F __branches gco
complete -o default -o nospace -F __branches gcob
complete -o default -o nospace -F __branches gd
complete -o default -o nospace -F __branches gm
complete -o default -o nospace -F __branches gp
complete -o default -o nospace -F __branches gpu
