alias b="bundle exec"
alias b?="bundle check"
alias bi="run 'bundle install --path=vendor/bundle'"

alias c="run 'bundle exec rails console'"
alias r!="run 'bundle exec rails server'"
alias r-="cat tmp/pids/server.pid | xargs kill -9"
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
alias hc!="heroku config:set"
alias hcp!="heroku config:set -r production"
alias hcs!="heroku config:set -r staging"

function hl() {
  run "heroku logs --tail -r ${1:-production}"
}

function c!() {
  run "heroku run console -r ${1:-production}"
}

function db() {
  local app=$(pwd | last_dir_in_path)
  local env=${1:-development}
  run "psql ${app}_${env}"
}

function db!() {
  local env=${1:-production}
  echo "Looking up follower..."
  local follower=$(heroku pg:info -r $env | grep Followers | awk '{print $2}')
  run "heroku pg:psql ${follower:-DATABASE_URL} -r $env"
}
