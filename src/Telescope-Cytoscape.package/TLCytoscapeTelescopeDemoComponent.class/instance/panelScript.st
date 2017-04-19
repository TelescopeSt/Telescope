initialization
panelScript
	^ 'function initTabs() {
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