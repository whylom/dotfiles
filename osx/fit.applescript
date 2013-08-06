-- Unless we trim the height of a window by 22 pixels,
-- the width is affected. No idea why.
set height_offset to 22

-- DISPLAY_WIDTH and DISPLAY_HEIGHT are set when the shell loads.
set width to (do shell script "echo $DISPLAY_WIDTH")
set height to (do shell script "echo $DISPLAY_HEIGHT") - height_offset

-- Resize all iTerm windows to the display's width and height.
tell application "iTerm"
  repeat with i from (count of windows) to 1 by -1
    set bounds of window i to {0, 0, width, height }
  end repeat
end tell
