alias h="heroku"
alias h?="heroku help"
alias h!="heroku run"

alias hc="heroku config"
alias hc!="heroku config:set"
alias hcp="heroku config -r production"
alias hcs="heroku config -r staging"
alias hcp?="heroku config -r production | grep -i"
alias hcs?="heroku config -r staging | grep -i"
alias hcp!="heroku config:set -r production"
alias hcs!="heroku config:set -r staging"

function hl() {
  run "heroku logs --tail -r ${1:-production}"
}

function c!() {
  run "heroku run console -r ${1:-production}"
}

function db!() {
  local env=${1:-production}
  echo "Looking up follower..."
  local follower=$(heroku pg:info -r $env | grep Followers | awk '{print $2}')
  run "heroku pg:psql ${follower:-DATABASE_URL} -r $env"
}

function rdbm!() {
  run "heroku run rake db:migrate -r ${1:-production}"
}
