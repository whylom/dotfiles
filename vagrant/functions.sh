function vx() {
  vssh -o LogLevel=quiet "g rails/current && $1"
}

function t() {
  vx "bundle exec spin push $1"
}

function t?() {
  # concatenate arguments into a *-delimited query string
  query="*$(echo $@ | sed 's/ /*/g')*"

  # search the Rails test directory for that pattern
  results=$(find test -name $query.rb)

  # display the results, numbered
  i=1
  for line in $results; do
    echo "$i. $line"
    let i++
  done

  if [[ $i = 1 ]]; then
    echo "No matches"
    return
  fi

  # let the user select a test by number
  read -p "Which test do you fancy then? " num
  test=$(echo "$results" | nthline $num)

  # copy test to clipboard
  echo $test | pbcopy

  # run the test
  warn "spin push $test"
  t $test
}
