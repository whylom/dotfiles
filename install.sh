function symlink() {
  if [ -h $2 ]; then rm $2; fi # delete symlink if it exists
  ln -s $1 $2
}

# symlink all dotfiles ending in .symlink
for original in $HOME/.dotfiles/*/**.symlink; do
  link=$(basename $original) # extract filename
  link=${link%.symlink}      # remove ".symlink"
  link="$HOME/.$link"        # prepend with "~/."
  symlink $original $link
done

# manually create symlinks that defy naming conventions
symlink ~/.dotfiles/dotjs ~/.js
symlink ~/.dotfiles/bashrc.sh ~/.bashrc
