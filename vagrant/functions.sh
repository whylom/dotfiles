function vx() {
  vssh -o LogLevel=quiet "g rails/current && $1"
}
