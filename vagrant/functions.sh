function vx() {
  vssh -o LogLevel=quiet "g rails/current && $1"
}

function t() {
  vx "bundle exec spin push $1"
}

function t?() {
  # concatenate arguments into a string delimited by .*
  query="$(echo $@ | sed 's/ /.*/g')"

  # start with ALL of the Ruby files under the Rails test directory
  testfiles=$(find test -name *.rb)

  results=()
  i=0

  # if file matches query, display it and add to results array
  for file in $testfiles; do
    if [[ $file =~ $query ]]; then
      let i++
      results+=($file)
      echo "$i. $file"
    fi
  done

  if [[ $i = 0 ]]; then
    echo "No matches"
    return
  fi

  # let the user select a test by number
  read -p "Which test do you fancy then? " num
  test=${results[$num-1]}

  # copy test to clipboard
  echo $test | pbcopy

  # run the test
  warn "spin push $test"
  t $test
}
