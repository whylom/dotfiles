alias b="bundle exec"
alias bi="bundle install"

alias r="b rails"
alias c="r console"

function s() {
  r server -p ${1:-3000}
}
