# files [master] $
#   ^      ^     ^
#   |      |     |
#   |      |      -- old-school $ sigil to keep it real
#   |      |
#   |       ---  current Git branch (in green!)
#   |
#    --- name of current directory

export PS1='\W\[\e[0;32m\]$(git_prompt)\e[0m\] $ '
