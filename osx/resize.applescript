-- 1440 is the width of a 15" MacBook Pro display
set mbp_width to 1440

-- Unless we trim the height of a window by 22 pixels,
-- the width is affected. No idea why.
set height_offset to 22

tell application "Finder"
  set dimensions to bounds of window of desktop
  set app_width to item 3 of dimensions
  set app_height to item 4 of dimensions
end tell

-- If using a dual-monitor display, the width will be the total
-- width of both monitors. Subtract the known width of the laptop
-- display to get the width of the external monitor.
if app_width is greater than mbp_width then
  set app_width to app_width - mbp_width
end if

set app_height to app_height - height_offset

tell application "iTerm"
  repeat with i from (count of windows) to 1 by -1
    set bounds of window i to {0, 0, app_width, app_height}
  end repeat
end tell
