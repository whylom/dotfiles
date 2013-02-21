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
  git status -sb | strp | nthline $(($1 + 1)) | nthword 2 | chomp
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
      git_status_nth $arg | xargs git add
    elif [[ $arg =~ ^[MD?]$ ]]; then
      git status -sb | strp | grep "^$arg" | nthword 2 | inline | xargs git add
    else
      git add $arg
    fi
  done
}

function gcm() {
  message="$*"
  maxlength=50
  length=${#message}

  if [[ $length = 0 ]]; then
    read -p "How about a commit message: " message
    gcm $message
  elif [[ $length > $maxlength ]]; then
    echo "Your commit message is `expr $length - $maxlength` characters too long."
    read -p "Try a shorter message: " message
    gcm $message
  else
    git commit -m "$message"
  fi
}

function gcam() {
  message="$*"
  maxlength=50
  length=${#message}

  if [[ $length = 0 ]]; then
    read -p "How about a commit message: " message
    gcam $message
  elif [[ $length > $maxlength ]]; then
    echo "Your commit message is `expr $length - $maxlength` characters too long."
    read -p "Try a shorter message: " message
    gcam $message
  else
    git commit -a -m "$message"
  fi
}

function gco() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    git_status_nth $1 | xargs git checkout
  else
    git checkout "$@"
  fi
}

function gcot() {
  # treats remote:branch like remote/branch
  git checkout -t ${1/://}
}

# copies to clipboard the nth filename listed by git status
function gcp() {
  git_status_nth $1 | pbcopy
}

# shows diff for nth file listed by git status
function gd() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    git_status_nth $1 | xargs git diff
  else
    git diff $1
  fi
}

function gf() {
  run "git fetch ${1:-root}"
}

function gmr() {
  run "git merge root/${1:-$(git_branch)}"
}

function gp() {
  run "git push origin ${1:-$(git_branch)}"
}

function gpr() {
  run "git push root ${1:-$(git_branch)}"
}

function gpu() {
  run "git push -u origin ${1:-$(git_branch)}"
}

# Remove remote branches from origin that don't have a
# corresponding local branch
function grr!() {
  echo "Getting list of remote branches..."
  remote_branches=$(git ls-remote --heads origin | cut -f 2)

  for branch in $remote_branches; do
    branch_exists_locally=`git show-ref --verify --quiet $branch`

    # if local branch doesn't exist, delete the remote branch
    if [[ $? = 1 ]]; then
      run "git push origin :${branch#refs/heads/}"
    fi
  done
}

# Delete branches from remotes (except origin and root)
function gprune!() {
  git branch -a | grep remotes | grep -vE '(origin|root)' | strp | inline | xargs git branch -D
}

# Tricked-out "git branch" that color codes root branches and indicates
# tracking branches based on forks.
function gb+() {
  OIFS="${IFS}"
  IFS=$'\n'
  status=`git branch -vv | tr -d '*' | tr -s ' ' | strp`
  current_branch="$(git_branch)"

  for line in $status; do
    # extract branch name
    branch=$(echo $line | 1stword)

    # extract remote ("origin", "root", "defunkt", etc.)
    remote=${line#*[}
    remote=${remote%]*}
    remote=${remote%/*}

    if [[ $branch = $current_branch ]]; then
      # display current branch the usual way (in green with an asterisk)
      output="* \033[32m$branch\033[0m"
    elif [[ $remote = 'root' ]]; then
      # display root branches in purple
      output="  \033[35m$branch\033[0m"
    else
      output="  $branch"
    fi

    # append name of remote if neither "origin" nor "root" (ie: a fork)
    if [[ $remote != 'origin' && $remote != 'root' ]]; then
      output="$output [\033[36m$remote\033[0m]"
    fi

    echo -e $output
  done

  IFS="${OIFS}"
}

function gs() {
  OIFS="${IFS}"
  IFS=$'\n'
  status=`git status -sb`
  i=0

  for line in $status; do
    if [[ $i > 0 ]]; then
      line="$i. $line"
    fi
    echo "$line"
    let i++
  done

  IFS="${OIFS}"
}

# copies to clipboard the SHA of the nth commit listed by git log
function gsha() {
  git_log_nth $1 | chomp | pbcopy
}

# What did we ship in the last week? (lists feature branches merged into master)
function gsh() {
  # Search log for merge commits in the last week
  log=$(git log --pretty=format:'%h %C(cyan)%cd %C(reset)%s' --date=short --merges --since=1.week | grep "Merge remote-tracking branch")

  # reformat log entries for readability
  shipped=$(echo "$log" | sed "s/Merge remote-tracking branch //g" | sed "s/'//g")

  if [ -z $1 ]; then
    # gsh -> show all branches
    echo "$shipped"
  elif [[  $1 =~ ^- ]]; then
    # gsh -foo -> hide foo's branches
    arg=$1
    echo "$shipped" | grep -i -v ${arg#-}
  else
    # gsh foo -> show only foo's branches
    echo "$shipped" | grep -i $1
  fi
}

# copies to clipboard the SHA of the nth commit listed by git log
function gshow() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    git_log_nth $1 | chomp | xargs git show
  else
    git show $1
  fi
}

function gunstage() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    git_status_nth $1 | xargs git reset HEAD
  else
    git reset HEAD
  fi
}
