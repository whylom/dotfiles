// Toggle left-hand menu with shift + right/left arrow keys
$(document).keydown((event) => {
  const LEFT_ARROW = 37;
  const RIGHT_ARROW = 39;

  if (event.shiftKey) {
    if (event.which == LEFT_ARROW || event.which == RIGHT_ARROW) {
      // Simulate a click on the left menu's "hamburger" icon
      $('[aria-label="Main drawer"]').click();
    }
  }
});

(function() {
  // Make the hangouts link easier to see
  $('a:contains("Join meeting")').css('fontWeight', 'bold');

  // The above elements are not in the page on load, so keep polling
  setTimeout(arguments.callee, 500);
})();
