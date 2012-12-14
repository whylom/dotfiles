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
