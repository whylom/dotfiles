alias b="bundle exec"
alias bi="bundle install"

alias c="b rails console"
alias r="b rake"

function rdbm() {
  run "bundle exec rake db:migrate RAILS_ENV=${1:-development}"
}
alias rdbm+="rdbm && rdbm test"

alias rdbr="r db:drop db:setup"
alias rdbr+="rdbr && rdbr RAILS_ENV=test"

alias t="spin push"
