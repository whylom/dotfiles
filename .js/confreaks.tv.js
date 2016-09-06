function toRunningTime(totalSeconds) {
  totalSeconds = parseInt(totalSeconds);

  var secondsPerMinute = 60;
  var secondsPerHour = secondsPerMinute * 60;

  var hours = Math.floor(totalSeconds / secondsPerHour);
  var remaining = totalSeconds - (hours * secondsPerHour)

  var minutes = Math.floor(remaining / secondsPerMinute);
  var seconds = remaining - (minutes * secondsPerMinute)

  // minutes has a leading zero only if hours are present
  // eg: "1:07:00" vs "7:00"
  if (hours && minutes < 10) minutes = '0' + minutes;

  // seconds always has a leading zero
  if (seconds < 10) seconds = '0' + seconds;

  // return mm:ss if less than an hour, otherwise hh:mm:ss
  var time = [hours, minutes, seconds];
  if (hours < 1) time.shift();

  return time.join(":");
}

function getVideoID() {
  return $('iframe').attr('src').match(/embed\/(.*)\?fs=1/)[1];
}

// running not in markup, so use YouTube API to look it up
function getRunningTime(callback) {
  var url = "http://gdata.youtube.com/feeds/api/videos/"+ getVideoID() +"?v=2&alt=jsonc&prettyprint=true";
  $.getJSON(url, function(response) {
    callback(toRunningTime(response.data.duration));
  });
}

// remove junk whitespace found in markup
function clean(s) {
  return s.replace(/(^\s+|\s+$)/, '').replace(/\s+/, ' ');
}

function getTalk() {
  return clean( $('.video-title a').html() );
}

function getSpeaker() {
  return clean( $('.video-presenters a').html() );
}

function rewriteTitle() {
  getRunningTime(function(runningTime) {
    $('title').html(getTalk() + " - " + getSpeaker() + " (" + runningTime + ")");
  });
}

rewriteTitle();
