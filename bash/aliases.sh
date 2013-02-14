# generally useful aliases
alias cd..="cd .."
alias reload="source ~/.bashrc"
alias ls="ls -AGh"
alias ll="ls -AGhl"


# useful shortcuts for Bash 1-liners

# encapitalify all teh words
alias capitalize="tr '[a-z]' '[A-Z]'"

# remove newlines
alias chomp="tr -d '\n'"

# concatenate multiple lines with a space delimiter
alias inline='tr "\\n" " "'

# strip whitespace
alias strp="sed 's/^ *//g;s/ *$//g'"
