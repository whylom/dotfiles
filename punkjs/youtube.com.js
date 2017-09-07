// Extract video's duration from a big honking horror of JS
var wtf = $('#player script:last').html();
var matches = wtf.match(/"length_seconds":"(\d+)"/)
var duration = parseInt(matches[1]) - 1;

// Calculate hours, minutes, and seconds from total duration.
var hours = Math.floor(duration / 3600);
var minutes = Math.floor((duration - (hours * 3600)) / 60);
var seconds = duration - (hours * 3600) - (minutes * 60);

// Format running time as "1:02:03" / "2:03"
if (hours && minutes < 10) minutes = "0" + minutes;
if (seconds < 10) seconds = "0" + seconds;
time = [hours, minutes, seconds].join(':').replace(/^0:/, '');

var repeats = 0;
(function() {
  // Replace "YouTube" in the page title with the running time.
  document.title = document.title.replace('- YouTube', '(' + time + ')');

  // Do this every 10ms, but only 10 times, to get out of the way of the code
  // YouTube is running to mess with the title.
  if (repeats++ < 10) setTimeout(arguments.callee, 100);
})();
