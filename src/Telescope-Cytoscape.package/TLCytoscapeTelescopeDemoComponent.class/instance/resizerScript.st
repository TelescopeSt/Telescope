initialization
resizerScript
	^ 'function initResizer() {
    (document.getElementsByClassName("resizer")[0]).addEventListener(''mousedown'', initResize);
}

function initResize() {
    (document.getElementsByTagName("body")[0]).setAttribute("style", "-webkit-touch-callout: none; -webkit-user-select: none; -khtml-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none;")
    var vs = document.getElementsByClassName("visualization");
    for (var i = 0; i < vs.length; i++) {
        vs[i].firstChild.style.width = 0
    }
    window.addEventListener(''mousemove'', Resize);
    window.addEventListener(''mouseup'', stopResize);
}
function Resize(e) {
    var resizer = document.getElementsByClassName("resizer")[0];
    resizer.parentNode.style.width = (e.clientX - resizer.parentNode.offsetLeft) + ''px'';
}
function stopResize() {
    (document.getElementsByTagName("body")[0]).removeAttribute("style");
    window.removeEventListener(''mousemove'', Resize);
    window.removeEventListener(''mouseup'', stopResize);
    for (i = 0; i < visus.length; i++) {
        visus[i].visu.resize();
        visus[i].visu.fit()
    }
}'