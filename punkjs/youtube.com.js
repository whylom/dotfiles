function duration() {
  var wtf = $('#player script:last').html();
  var matches = wtf.match(/"length_seconds":"(\d+)"/)
  return parseInt(matches[1]) - 1;
}

function format(duration) {
  // Calculate hours, minutes, and seconds from total duration.
  var hours = Math.floor(duration / 3600);
  var minutes = Math.floor((duration - (hours * 3600)) / 60);
  var seconds = duration - (hours * 3600) - (minutes * 60);

  // Format running time as "1:02:03" or "2:03" or "0:03"
  if (hours && minutes < 10) minutes = "0" + minutes;
  if (seconds < 10) seconds = "0" + seconds;
  var formatted = [hours, minutes, seconds].join(':')

  // Remove leading 0: (could be hours or minutes)
  return formatted.replace(/^0:/, '');
}

function putDurationInTitle() {
  var time = '(' + format(duration()) + ')';
  document.title = document.title.replace('- YouTube', time);
}


function dimSidebar() {
  var sidebars = $('#related, #playlist');

  var opacity = (n) => { sidebars.css('opacity', n) }
  var dim     = ()  => { opacity(0.1) }
  var undim   = ()  => { opacity(1.0) }

  sidebars.hover(undim, dim);
  dim();
}


var repeats = 0;
(function() {
  putDurationInTitle();
  dimSidebars();

  // Do this every 10ms, but only 10 times, to get out of the way of the code
  // YouTube is running to mess with the title.
  if (repeats++ < 10) setTimeout(arguments.callee, 100);
})();
