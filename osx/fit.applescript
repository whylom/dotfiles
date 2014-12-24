-- DISPLAY_WIDTH and DISPLAY_HEIGHT are set when the shell loads.
set width to (do shell script "echo $DISPLAY_WIDTH") + 2
set height to (do shell script "echo $DISPLAY_HEIGHT")

-- Resize all iTerm windows to the display's width and height.
tell application "iTerm"
  repeat with i from (count of windows) to 1 by -1
    set bounds of window i to {0, 0, width, height }
  end repeat
end tell
