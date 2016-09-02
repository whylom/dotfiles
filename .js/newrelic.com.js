// If there's only 1 app listed, just go to that app's page.
(function() {
  var apps = $('td.app_name');
  if (apps.length == 1) {
    var link = (apps.find('a'));
    document.location = link.attr('href');
    return;
  }
  setTimeout(arguments.callee, 50);
})();
