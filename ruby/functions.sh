function spin?() {
  # concatenate arguments into a string delimited by .*
  query="$(echo $@ | sed 's/ /.*/g')"

  # get paths to all relevant Ruby files in the spec directory
  specs=$(find spec -name *.rb | grep -vE '(factories|helper|support)')

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
