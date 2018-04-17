downloading
downloadingJs
	^ 'Telescope = {};

Telescope.download= function(filename, url) {
  var a = $("<a>")
    .attr("href", url)
    .attr("download", filename)
    .appendTo("body");

  a[0].click();
  a.remove();
}'