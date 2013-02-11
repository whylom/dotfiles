function vx() {
  vssh -o LogLevel=quiet "g rails/current && $1"
}

function t() {
  vx "bundle exec spin push $1"
}

function t?() {
  query="*$(echo $@ | sed 's/ /*/g')*"
  results=$(find test -name $query.rb)

  i=1
  for line in $results; do
    echo "$i. $line"
    let i++
  done

  if [[ $i = 1 ]]; then
    echo "No matches"
    return
  fi

  read -p "Select a test (or 'q' to quit): " num

  if [[  $num = 'q' ]]; then
    return
  fi

  test=$(echo "$results" | nthline $num)
  warn "spin push $test"
  t $test
}
