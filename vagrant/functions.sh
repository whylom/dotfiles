function vx() {
  ssh vagrant "$@"
}

function docker() {
  ssh vagrant "docker $@"
}
