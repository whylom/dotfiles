function dbash() {
  docker-compose exec $1 bash
}

function dlog() {
  if [[ $1 == "-e" ]]; then
    bin/dde logs -f -t 25 $(docker-compose ps --services | grep -v elasticsearch)
  else
    bin/dde logs -f -t 25 $1
  fi
}
