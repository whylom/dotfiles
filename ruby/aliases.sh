alias b="bundle exec"
alias bi="run 'bundle install --path=vendor/bundle'"

alias c="bundle exec rails console"
alias r="bundle exec rake"
alias rs="bundle exec rspec"

function rdbm() {
  run "bundle exec rake db:migrate RAILS_ENV=${1:-development}"
}

alias h="heroku"
alias h?="heroku help"
alias db!="run 'heroku pg:psql -r production'"

function c!() {
  run "heroku run console -r ${1:-production}"
}
