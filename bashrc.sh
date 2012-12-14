# environment variables
export EDITOR="subl -w"
export PATH=/usr/local/bin:$PATH

# aliases
alias cd..="cd .."
alias reload="source ~/.bashrc"

# load .sh files
for f in ~/.dotfiles/**/*.sh; do source $f; done

# load private.sh (ain't none of your bidness anyhow)
if [ -e ~/.dotfiles/private.sh ]; then source ~/.dotfiles/private.sh; fi

# go to our favorite directory if we're in ~
if [ $(pwd) = $HOME ]; then cd $FAVE; fi

# customize prompt
export PS1='\[\e[0;32m\][home]\e[0m\] \W$(git_prompt) => '
