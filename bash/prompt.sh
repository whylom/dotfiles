# [home] stuffs [master] =>
#    ^      ^       ^     ^-- trendy arrow-like sigil
#    |      |       |
#    |      |        -- current Git branch
#    |      |
#    |       --- current directory
#    |
#     --- to remind me this is not a virtual machine

export PS1='\[\e[0;32m\][home]\e[0m\] \W$(git_prompt) => '
