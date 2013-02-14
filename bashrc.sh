# environment variables
export EDITOR="subl -w"
export PATH=/usr/local/bin:$PATH

# load .sh files
for f in ~/.dotfiles/**/*.sh; do source $f; done

# load private.sh (ain't none of your bidness anyhow)
if [ -e ~/.dotfiles/private.sh ]; then source ~/.dotfiles/private.sh; fi

# go to our favorite directory if we're in ~
if [ $(pwd) = $HOME ]; then cd $FAVE; fi
