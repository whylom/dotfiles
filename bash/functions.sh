function run() {
  echo -e "\033[36m$1\033[0m" # warn user what we're about to do
  sleep 1.5                   # give them some time to Ctrl-C
  eval $1                     # FIRE!
}

function last_dir_in_path() {
  # using "/" as the delimiter, print the last item
  awk -F / '{ print $NF }'
}

function nthline() {
  sed -n $1p
}

function nthword() {
  cut -d ' ' -f $1
}
