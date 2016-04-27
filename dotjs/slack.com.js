// redirect from stupid Shared Document page to actual shared document
var url = $('#file_page_preview a').attr('href');
if (url) document.location = url;
