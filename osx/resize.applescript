tell application "iTerm"
  repeat with i from (count of windows) to 1 by -1
    set bounds of window i to {0, 30, 1920, 9000}
  end repeat
end tell
