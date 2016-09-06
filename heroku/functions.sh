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
