# environment variables
export EDITOR="subl -w"
export PATH=/usr/local/bin:$PATH

# save dimensions of main display (primarily for use in AppleScript)
DISPLAY_DIMENSIONS=$(system_profiler SPDisplaysDataType | grep 'Resolution' | head -1 | tr -d ' ' | cut -f 2 -d ':')
export DISPLAY_WIDTH=$(echo $DISPLAY_DIMENSIONS | cut -f 1 -d 'x' )
export DISPLAY_HEIGHT=$(echo $DISPLAY_DIMENSIONS | cut -f 2 -d 'x' )

# load .sh files
for f in ~/.dotfiles/**/*.sh; do source $f; done

# load private.sh (ain't none of your bidness anyhow)
if [ -e ~/.dotfiles/private.sh ]; then source ~/.dotfiles/private.sh; fi

# go to our favorite directory if we're in ~
if [ $(pwd) = $HOME ]; then cd $FAVE; fi
