alias b="bundle exec"
alias b?="bundle check"
alias bi="run 'bundle install --path=vendor/bundle'"

alias c="run 'bundle exec rails console'"
alias r!="run 'bundle exec rails server'"
alias r="bundle exec rake"
alias rs="bundle exec rspec"

function rdbm() {
  run "bundle exec rake db:migrate RAILS_ENV=${1:-development}"
}

function rdbm!() {
  run "heroku run rake db:migrate -r ${1:-production}"
}

alias rdbm~="run 'bundle exec rake db:migrate:redo'"
alias rdbm-="run 'bundle exec rake db:rollback'"

alias s!="run 'spin serve'"

function s() {
  spin push $@
  echo $@ | chomp | pbcopy
}

alias h="heroku"
alias h?="heroku help"
alias h!="heroku run"

alias hc="heroku config"
alias hcp="heroku config -r production"
alias hcs="heroku config -r staging"
alias hcp?="heroku config -r production | grep -i"
alias hcs?="heroku config -r staging | grep -i"

function c!() {
  run "heroku run console -r ${1:-production}"
}

function db() {
  local app=$(pwd | last_dir_in_path)
  local env=${1:-development}
  run "psql ${app}_${env}"
}

function db!() {
  run "heroku pg:psql -r ${1:-production}"
}
