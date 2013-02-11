# useful shortcuts for Bash 1-liners

function nthline() {
  head -n $1 | tail -1
}

function nthword() {
  cut -d ' ' -f $1
}

function 1stword() {
  cut -d ' ' -f 1
}

function warn() {
  echo -e "\033[36m$1\033[0m"
}
