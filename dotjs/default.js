function seconds(n) {
  return 1000 * n;
}

function minutes(n) {
  return seconds(60) * n;
}

// // hide all the fucking sidebars
// var domain = document.location.hostname;
// var blacklist = 'www.google.com app.simplenote.com';

// if (!blacklist.includes(domain)) {
//   $('#sidebar, .sidebar').css('opacity', '0.1');
// }
