# [home] stuffs [master]
# $
#    ^      ^       ^
# ^  |      |       |
# |  |      |        -- current Git branch
# |  |      |
# |  |       --- current directory
# |  |
# |   --- to remind me this is not a virtual machine
# |
#  --- old-school $ sigil to keep it real

export PS1='\[\e[0;32m\][home]\e[0m\] \w$(git_prompt) \n$ '
