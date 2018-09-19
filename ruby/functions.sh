function cop() {
  # 1st arg defaults to "." (the current directory)
  # silence "unrecognized parameter" warning by redirecting stderr to /dev/null
  rubocop ${1:-.} 2>/dev/null
}

# start & stop Mailcatcher
function mc() {
  if   [ -z $1 ]; then
    echo 'Try "mc start" or "mc stop" or "mc open"'
  elif [ $1 = "start" ]; then
    mailcatcher --browse
  elif [ $1 = "stop" ]; then
    lsof -i :1080 | grep ruby | awk '{ print $2 }' | xargs kill -9
  elif [ $1 = "open" ]; then
    open http://127.0.0.1:1080
  fi
}

function s() {
  # specify 1 or more specs to run with Spin
  spin push $@

  # copy specified files to clipboard
  echo $@ | chomp | pbcopy
}

# select 1 or more specs to run with Spin (with fuzzyish matching!)
function s?() {
  # concatenate arguments into a string delimited by .*
  query="$(echo $@ | sed 's/ /.*/g')"

  # get paths to all relevant Ruby files in the spec directory
  specs=$(find spec -name "*_spec.rb")

  # add any spec that matches the query pattern to the results array
  matches=()
  for spec in $specs; do
    if [[ $spec =~ $query ]]; then
      matches+=($spec)
    fi
  done
  num_matches=${#matches[@]}

  if [[ $num_matches = 0 ]]; then
    # if 0 files were found, quit
    echo "No matches"
  else
    # otherwise, display a numbered list of all matches
    for (( i=0; i<${num_matches}; i++ )); do
      echo "$(($i+1)). ${matches[$i]}"
    done

    # let the user select a file by number
    read -p "Select one or more specs by number (or 'q' to quit): " response
    if [[ $response = 'q' ]]; then return; fi

    # split user's string response to an array of indexes
    IFS=' ' read -a indexes <<< "$response"

    # use indexes to create a space-delimited list of files
    specs=""
    for (( i=0; i<${#indexes[@]}; i++ )); do
      index=${indexes[$i]}
      spec=${matches[$index-1]}
      specs="$specs $spec"
    done

    # remove leading space
    specs=$(echo $specs)

    # run the selected spec(s)
    run "spin push $specs"
  fi
}
