function duration() {
  var wtf = $('script:contains("approxDurationMs")').html();
  var durationInMs = wtf.match(/\\"approxDurationMs\\":\\"(\d+)\\"/)[1];
  var durationInSeconds = parseInt(durationInMs) / 1000
  return durationInSeconds;
}

function format(duration) {
  // Calculate hours, minutes, and seconds from total duration.
  var hours = Math.floor(duration / 3600);
  var minutes = Math.floor((duration - (hours * 3600)) / 60);
  var seconds = Math.floor(duration - (hours * 3600) - (minutes * 60));

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
  return $('.ytd-channel-name a:first').text();
}

function titleStartsWithAuthor() {
  return document.title.indexOf(author()) == 0;
}

function putAuthorInTitle() {
  if (!titleStartsWithAuthor()) {
    document.title = author() + ' - ' + document.title;
  }
}

function isVideo() {
  return document.location.pathname == '/watch';
}

function isPlaylist() {
  var url = document.location;
  return url.pathname == '/playlist' && url.search.indexOf('list=WL') == -1;
}

function removeUnreadCount() {
  document.title = document.title.replace(/ \(\d+\) /, ' ');
}

function removeEmoji() {
  var emoji = /(?:[\u2700-\u27bf]|(?:\ud83c[\udde6-\uddff]){2}|[\ud800-\udbff][\udc00-\udfff]|[\u0023-\u0039]\ufe0f?\u20e3|\u3299|\u3297|\u303d|\u3030|\u24c2|\ud83c[\udd70-\udd71]|\ud83c[\udd7e-\udd7f]|\ud83c\udd8e|\ud83c[\udd91-\udd9a]|\ud83c[\udde6-\uddff]|[\ud83c[\ude01-\ude02]|\ud83c\ude1a|\ud83c\ude2f|[\ud83c[\ude32-\ude3a]|[\ud83c[\ude50-\ude51]|\u203c|\u2049|[\u25aa-\u25ab]|\u25b6|\u25c0|[\u25fb-\u25fe]|\u00a9|\u00ae|\u2122|\u2139|\ud83c\udc04|[\u2600-\u26FF]|\u2b05|\u2b06|\u2b07|\u2b1b|\u2b1c|\u2b50|\u2b55|\u231a|\u231b|\u2328|\u23cf|[\u23e9-\u23f3]|[\u23f8-\u23fa]|\ud83c\udccf|\u2934|\u2935|[\u2190-\u21ff])/g
  document.title = document.title.replace(emoji, '');
}

(function() {
  if (isVideo()) putDurationInTitle();

  putAuthorInTitle();
  removeUnreadCount();
  removeEmoji();

  setTimeout(arguments.callee, 500);
})();
