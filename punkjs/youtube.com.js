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

function author() {
  var wtf = $('html').html();
  var matches = wtf.match(/"shortBylineText":\{"runs":\[\{"text":"([^\"]*)"/)
  return matches[1];
}

function titleContainsAuthor() {
  return document.title.indexOf(author()) > -1;
}

function putAuthorInTitle() {
  if (!titleContainsAuthor()) {
    document.title = author() + ' - ' + document.title.replace('- YouTube - YouTube', '');
  }
}

function isVideo() {
  return document.location.pathname == '/watch';
}

function isPlaylist() {
  var url = document.location;
  return url.pathname == '/playlist' && url.search.indexOf('list=WL') == -1;
}

(function() {
  if (isVideo()) {
    putDurationInTitle();
  } else if (isPlaylist()) {
    putAuthorInTitle();
  }
  setTimeout(arguments.callee, 500);
})();
