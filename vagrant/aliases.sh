alias v="pp vagrant"
alias vp="v provision"
alias vu="v up"
alias vup="v up"

alias vssh="ssh vagrant" # skips Ruby, way faster than "pp vagrant ssh"
alias vs="vssh"

function vx() {
  vssh -o LogLevel=quiet "g rails/current && $1"
}

function t() {
  vx "bundle exec spin push $1"
}
