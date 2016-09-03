-- Get the width & height of the current display.
tell application "Finder"
  set _bounds to bounds of window of desktop
  set _width to item 3 of _bounds
  set _height to item 4 of _bounds
end tell

-- Make the window just a tiny bit shorter.
set titleBarHeight to 23

-- Resize all iTerm windows to fit the display.
tell application "iTerm"
  repeat with i from (count of windows) to 1 by -1
    set bounds of window i to { 0, 0, _width, _height - titleBarHeight }
  end repeat
end tell
