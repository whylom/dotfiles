(function() {
  // Make the hangouts link easier to see
  $('a:contains("Join meeting")').css('fontWeight', 'bold');

  // The above elements are not in the page on load, so keep polling
  setTimeout(arguments.callee, 500);
})();
