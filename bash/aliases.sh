alias cd..="cd .."
alias ls="ls -AGh"
alias ll="ls -AGhl"

alias reload="source ~/.bashrc"
alias reload!="reload"

alias ack="ag"
alias http="python -m SimpleHTTPServer"
alias p8="ping 8.8.8.8"


# encapitalify all teh words
alias capitalize="tr '[a-z]' '[A-Z]'"

# remove newlines
alias chomp="tr -d '\n'"

# concatenate multiple lines with a space delimiter
alias inline='tr "\\n" " "'

# strip whitespace
alias strp="sed 's/^ *//g;s/ *$//g'"
