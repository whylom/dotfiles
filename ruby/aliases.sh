alias b="bundle exec"
alias bi="run 'bundle install --path=vendor/bundle'"

alias c="bundle exec rails console"
alias r="bundle exec rake"
alias rs="bundle exec rspec"

function rdbm() {
  run "bundle exec rake db:migrate RAILS_ENV=${1:-development}"
}
alias rdbm+="rdbm && rdbm test"

alias h="heroku"
alias h?="heroku help"
alias c!="run 'heroku run console -r production'"
alias db!="run 'heroku pg:psql -r production'"
