-- Get the dimensions of the current display as a string like "1440x900"
set dimensions to do shell script "system_profiler SPDisplaysDataType | grep 'Resolution' | tr -d ' ' | cut -f 2 -d ':'"

-- Use `cut` to extract width & height since Applescript doesn't have string functions.
set width  to do shell script "echo " & dimensions & " | cut -f 1 -d 'x'"
set height to do shell script "echo " & dimensions & " | cut -f 2 -d 'x'"

-- No idea why this is necessary, but it is.
set padding to 2

-- Resize all iTerm windows to fit the display.
tell application "iTerm"
  repeat with i from (count of windows) to 1 by -1
    set bounds of window i to {0, 0, width + padding, height }
  end repeat
end tell
