downloading
downloadingJs
    ^ 'Telescope = {};

Telescope.downloadImage= function(filename, url) {
  var a = $("<a>")
    .attr("href", url)
    .attr("download", filename)
    .appendTo("body");

  a[0].click();
  a.remove();
}

Telescope.downloadJSON= function(filename, content) {
  var a = $("<a>")
    .attr("href", "data:text/plain;charset=utf-8," + encodeURIComponent(JSON.stringify(content, null, 2)))
    .attr("download", filename)
    .appendTo("body");

  a[0].click();
  a.remove();
}'