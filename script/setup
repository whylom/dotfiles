function symlink() {
  if [ -h $2 ]; then rm $2; fi # delete symlink if it exists
  ln -s $1 $2
}

function copy_if_needed() {
  if [ ! -f $2 ]; then cp $1 $2; fi
}

# symlink all dotfiles ending in .symlink
for original in $HOME/.dotfiles/*/**.symlink; do
  link=$(basename $original) # extract filename from path
  link=${link%.symlink}      # remove ".symlink"
  link="$HOME/.$link"        # prepend with "~/."
  symlink $original $link
done

# explictly symlink folders
symlink .js ~/.js

# make sure .bash_profile and .bashrc are in place
copy_if_needed bash/.bash_profile ~/.bash_profile
copy_if_needed bash/.bashrc       ~/.bashrc
