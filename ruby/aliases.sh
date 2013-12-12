alias b="bundle exec"
alias be="bundle exec"
alias bi="bundle install"

alias c="bundle exec rails console"
alias r="bundle exec rake"

function rdbm() {
  run "bundle exec rake db:migrate RAILS_ENV=${1:-development}"
}
alias rdbm+="rdbm && rdbm test"
