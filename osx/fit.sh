function fit() {
  local dimensions=$(system_profiler SPDisplaysDataType | grep 'Resolution' | head -1 | tr -d ' ' | cut -f 2 -d ':')
  export DISPLAY_WIDTH=$(echo $dimensions | cut -f 1 -d 'x' )
  export DISPLAY_HEIGHT=$(echo $dimensions | cut -f 2 -d 'x' )
  osascript ~/.dotfiles/osx/fit.applescript
}
