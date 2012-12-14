$(function($) {
  // inject CSS for a clean, modern style
  // https://github.com/scjung/jenkins-clean
  $('style').appendTo('head').text('* { color: #444; } a { text-decoration: none !important; color: #444 !important; } a:hover { background-color: #eee !important; } #top-panel { background: none !important; } #top-panel img { height: 0; } #top-panel img:after { content: "Jenkins"; } #search-box { border-radius: 5px; border: 1px solid #ccc; padding: 3px 3px 3px 20px; } #side-panel div { border-top: none !important; } #tasks { padding: 0 !important; margin-bottom: 10px; } #breadcrumbs { border-top: 1px solid #ddd !important; border-bottom: 1px solid #ddd !important; font-size: 20px !important; font-family: Georgia, serif !important; letter-spacing: -0.5px; } #breadcrumbs a:hover { background-color: transparent !important; } #breadcrumbs li { min-width: 80px; } #side-panel table.pane { margin-bottom: 10px; border-style: hidden !important; } #side-panel table.pane td { border: none !important; } #side-panel table.pane tr { border-bottom: 1px dotted #ccc !important; } #side-panel table.pane td.pane-header { border: 1px solid #ccc !important; border-radius: 5px; border-bottom: none !important; } #side-panel table.pane tbody tr:last-child, #side-panel table.pane tbody tr:first-child { border-bottom: none !important; } #executors tbody:nth-child(3) tr:first-child { display: none; } #header { margin: 5px 0; } #left-top-nav { padding-left: 0 !important; border-left: none !important; } #viewList td.noRight:nth-child(2) { border-top-left-radius: 5px; } #viewList td.noLeft:nth-last-child(2) { border-top-right-radius: 5px; } #viewList td.active, .bigtable th, td.pane-header { background-color: #edf1f4 !important; } #main-panel { padding-top: 0px !important; padding-right: 10px !important; } .bigtable tr { border-color: #ccc !important; } #side-panel { padding-left: 10px !important; } #main-table { background-image: none !important; } table.progress-bar tr { border: 1px solid #8bb3de !important; } td.progress-bar-done { background: -moz-linear-gradient(top,  #2e66a1,  #77a6d8) !important; } #main-panel h1 { margin-top: 5px !important; font-size: 18px; } #right-top-nav { margin-right: 5px !important; float: none; } #view-message { padding: 5px 0; } #description a img { margin-right: 5px; } ');
});
