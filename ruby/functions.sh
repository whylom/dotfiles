function t?() {
  # concatenate arguments into a string delimited by .*
  query="$(echo $@ | sed 's/ /.*/g')"

  # get paths to all relevant Ruby files in the spec directory
  files=$(find spec -name *.rb | grep -vE '(factories|helper|support)')

  # if file matches query, add it to results array
  results=()
  for file in $files; do
    if [[ $file =~ $query ]]; then
      results+=($file)
    fi
  done
  num_results=${#results[@]}

  if [[ $num_results = 0 ]]; then
    # if 0 files were found, quit
    echo "No matches"
  elif [[ $num_results = 1 ]]; then
    # if 1 file was found, go ahead & run it
    run "rspec ${results[0]}"
  else
    # otherwise, display a numbered list of all results
    for (( i=0; i<${num_results}; i++ )); do
      echo "$(($i+1)). ${results[$i]}"
    done

    # let the user select a file by number
    read -p "Which spec shall I run then? ('q' to quit): " num
    if [[ $num = 'q' ]]; then return; fi
    file=${results[$num-1]}

    # run the selected file
    run "rspec $file"
  fi
}
