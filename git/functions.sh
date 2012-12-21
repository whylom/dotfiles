function git_current_branch() {
  ref=$(git symbolic-ref HEAD 2>/dev/null)
  echo ${ref#refs/heads/}
}

function git_prompt() {
  if [ -z $(git_current_branch) ]; then
    echo ""
  else
    echo " [$(git_current_branch)]"
  fi
}

function gs_nth() {
  n=$(($1 + 1)) # ignore the 1st line of git status output (the current branch)
  git status -sb | strp | nthline $n | nthword 2 | chomp
}

# ga [M=modified] [D=deleted] [?=new] [1=1st file]
function ga() {
  if [[ $1 =~ ^[0-9]+$ ]] ; then
    gs_nth $1 | xargs git add
  elif [[ $1 =~ ^[MD?]$ ]] ; then
    git status -sb | strp | grep "^$1" | nthword 2 | inline | xargs git add
  else
    git add $1
  fi
}

# gcp 2 -> copies to clipboard the 2nd filename listed by git status
function gcp() {
  gs_nth $1 | pbcopy
}

# gd 2 -> shows diff for 2nd file listed by git status
function gd() {
  if [[ $1 =~ ^[0-9]+$ ]] ; then
    gs_nth $1 | xargs git diff
  else
    git diff $1
  fi
}

function gpu() {
  if [ -z $1 ]; then
    git push -u origin $(git_current_branch)
  else
    git push -u origin $1
  fi
}

# git remove remotes (except origin and root)
# makes everything faster
function grr!() {
  remotes=`git remote -v | cut -f 1 | uniq | grep -vE '(origin|root)'`
  for remote in $remotes; do
    git remote rm $remote
    echo "removed $remote"
  done
}

function gshipped() {
  git log --pretty=format:'%h %C(cyan)%cd %C(yellow)%an%C(reset) %s' --date=short --since=1.week | grep "Merge remote-tracking branch 'whylom/" | sed "s/Merge remote-tracking branch/merged/" | sed "s/'//g"
}
