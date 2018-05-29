# Tell 'em what yer gonna do, then do it
function run() {
  print "$1"
  eval $1
}

# Output given text in a pleasing shade of cyan
function print() {
  echo -e "\033[36m$1\033[0m"
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

function sum() {
  for i in $(cat); do
    local sum=$(($sum + $i))
  done

  echo $sum
}
