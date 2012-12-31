function git_branch() {
  ref=$(git symbolic-ref HEAD 2>/dev/null)
  echo ${ref#refs/heads/}
}

function git_prompt() {
  branch="$(git_branch)"
  if [ -z $branch ]; then
    echo ""
  else
    echo " [$branch]"
  fi
}

function git_status_nth() {
  n=$(($1 + 1)) # ignore the 1st line of git status output (the current branch)
  git status -sb | strp | nthline $n | nthword 2 | chomp
}



# takes multiple arguments, any of which can be
#   1-9 : nth file in git status listing
#   M   : all modified files
#   D   : all deleted files
#   ?   : all untracked files
function ga() {
  for arg in $@; do
    if [[ $arg =~ ^[0-9]+$ ]]; then
      git_status_nth $arg | xargs git add
    elif [[ $arg =~ ^[MD?]$ ]]; then
      git status -sb | strp | grep "^$arg" | nthword 2 | inline | xargs git add
    else
      git add $arg
    fi
  done
}

# gcp 2 -> copies to clipboard the 2nd filename listed by git status
function gcp() {
  git_status_nth $1 | pbcopy
}

# gd 2 -> shows diff for 2nd file listed by git status
function gd() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    git_status_nth $1 | xargs git diff
  else
    git diff $1
  fi
}

function gpu() {
  if [ -z $1 ]; then
    git push -u origin $(git_branch)
  else
    git push -u origin $1
  fi
}

# git remove remotes! (except origin and root)
function grr!() {
  remotes=`git remote -v | cut -f 1 | uniq | grep -vE '(origin|root)'`
  for remote in $remotes; do
    git remote rm $remote
    echo "removed $remote"
  done
}

function gunstage() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    git_status_nth $1 | xargs git reset HEAD
  else
    git reset HEAD
  fi
}

