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

function git_log_nth() {
  git log --pretty=format:'%H' | nthline $1
}

function git_status_nth() {
  git status --porcelain | strp | nthline $1 | tr -s ' ' | nthword 2 | xargs echo
}

function run() {
  echo -e "\033[36m$1\033[0m" # warn user what we're about to do
  sleep 1.5                   # give them some time to Ctrl-C
  eval $1                     # FIRE!
}

# takes multiple arguments, any of which can be
#   1-9 : nth file in git status listing
#   M   : all modified files
#   D   : all deleted files
#   ?   : all untracked files
function ga() {
  for arg in $@; do
    if [[ $arg =~ ^[0-9]+$ ]]; then
      git add "$(git_status_nth $arg)"
    elif [[ $arg =~ ^[MD?]$ ]]; then
      git status --porcelain | strp | grep "^$arg" | nthword 2 | inline | xargs git add
    else
      git add $arg
    fi
  done
  gs
}

function gco() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    git_status_nth $1 | xargs git checkout
  else
    git checkout "$@"
  fi
  gs
}

function gcom() {
  branch="$(git_branch)"
  if [[ $branch != "master" ]]; then
    git checkout master
  fi
}

# copies to clipboard the nth filename listed by git status
function gcp() {
  git_status_nth $1 | chomp | pbcopy
}

# shows diff for nth file listed by git status
function gd() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    git_status_nth $1 | xargs git diff
  else
    git diff $1
  fi
}

function gp() {
  run "git push origin ${1:-$(git_branch)}"
}

function gpu() {
  run "git push -u origin ${1:-$(git_branch)}"
}

function gprune() {
  read -p "This will delete any local branches you haven't yet pushed! Proceed? (y/n) " confirm
  if [[ $confirm != 'y' ]]; then return; fi

  local local_branches=$(git branch | tr -d ' *')
  local remote_branches=$(git ls-remote --heads origin | awk '{ print $2 }'  | sed 's|refs/heads/||')

  # delete any local branch that does not have a corresponding remote branch
  for branch in $local_branches; do
    if [[ ! $remote_branches =~ $branch ]]; then
      git branch -D $branch
    fi
  done

  # remove obsolete hidden tracking branches (remotes/origin/foo)
  git remote prune origin
}

function gbl() {
  if [ -z $2 ]; then
    git blame $1
  else
    git blame $1 | grep -C 5 "$2"
  fi
}

function grm() {
  rm $(git_status_nth $1)
  gs
}

function gs() {
  OIFS="${IFS}"
  IFS=$'\n'
  status=`git status -sb`
  i=1

  for line in $status; do
    if [[ $line =~ ^## ]]; then
      if [[ $line =~ (behind|ahead) ]]; then
        echo "$line"
      fi
    else
      echo "$i. $line"
      let i++
    fi
  done

  IFS="${OIFS}"
}

# copies to clipboard the SHA of the nth commit listed by git log
function gsha() {
  git_log_nth $1 | chomp | pbcopy
}

function gsho() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    git_log_nth $1 | chomp | xargs git show
  else
    git show $1
  fi
}

function gus() {
  if [ $# = 0 ]; then
    git reset -q HEAD
  else
    for arg in $@; do
      if [[ $arg =~ ^[0-9]+$ ]]; then
        git reset -q HEAD "$(git_status_nth $arg)"
      else
        git reset -q HEAD $arg
      fi
    done
  fi
  gs
}
