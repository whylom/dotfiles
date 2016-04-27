# generally useful aliases
alias cd..="cd .."
alias reload="source ~/.bashrc"
alias reload!="reload"
alias ls="ls -AGh"
alias ll="ls -AGhl"

alias http="python -m SimpleHTTPServer"

alias p="ping"
alias p8="ping 8.8.8.8"

# useful shortcuts for Bash 1-liners

# encapitalify all teh words
alias capitalize="tr '[a-z]' '[A-Z]'"

# remove newlines
alias chomp="tr -d '\n'"

# concatenate multiple lines with a space delimiter
alias inline='tr "\\n" " "'

# strip whitespace
alias strp="sed 's/^ *//g;s/ *$//g'"
