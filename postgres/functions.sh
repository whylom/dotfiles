# start & stop PostgreSQL
function pg() {
  if   [ -z $1 ]; then
    echo 'Try "pg start" or "pg stop"'
  elif [ $1 = "start" ]; then
    pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
  elif [ $1 = "stop" ]; then
    pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop
  fi
}
