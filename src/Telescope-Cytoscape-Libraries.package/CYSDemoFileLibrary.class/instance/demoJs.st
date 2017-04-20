files
demoJs
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
}




function initTabs() {
     var tabs = document.getElementsByClassName("tab");
     for (var i = 0; i < tabs.length; i++) {
      initTab(tabs[i]);
	  }
}

function initTab(tab){
    tab.addEventListener(''click'', function(e) {
        if (tab.getAttribute(''href'').charAt(0) === ''#'') {
          e.preventDefault();
          var href = tab.href.split(''#'')[1];
          var panel = document.getElementById(href);
          resetTabState();
          resetPanelState();
          tab.classList.add("isActive");
          panel.classList.add("isActive");
for(i=0;i<visus.length;i++)visus[i].visu.resize();for(i=0;i<visus.length;i++)visus[i].visu.fit();
        }
});
}

function resetTabState() {
    var tabs = document.getElementsByClassName("tab");
    for (var k = 0; k < tabs.length; k++) {
      tabs[k].classList.remove("isActive");
    }
}

function resetPanelState() {
    var panels = document.getElementsByClassName("panel");
    for (var k = 0; k < panels.length; k++) {
      panels[k].classList.remove("isActive");
    }
}
'