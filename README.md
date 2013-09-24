# dotfiles

A home for my humble dotfiles. This is not a fork, but it does happily steal ideas from [many other dotfile repos](http://dotfiles.github.com/). Please fork it, steal it, or revile it as your tastes dictate.

## Install

1. `git clone git@github.com:whylom/dotfiles.git`
2. `cd dotfiles`
3. `./install.sh` (I'm sure you look at any and all [install scripts](install.sh) before running them, right?)
4. `./osx/configure` (optionally run a script to configure OS X with my preferred defaults)

## Quick Tour

* Like [Zach Holman's dotfiles](https://github.com/holman/dotfiles), my dotfiles are organized into topic folders,
* Any *.symlink files are symlinked into ~ during installation.
* Any *.sh files are included by .bashrc.
* Put anything you want to keep out of version control into `private.sh`. This file has already been `.gitignore`'d for you.
* The `dotjs` folder is symlinked to `~/.js`. These files customize web pages using Chris Wanstrath's kickass [dotjs](https://github.com/defunkt/dotjs) Chrome extension.
* Most of the customization firepower is in `git/functions.sh`.

![screenshot](http://cl.ly/image/2C00460v413M/dotfiles-screenshot.png)
