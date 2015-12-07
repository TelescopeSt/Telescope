as yet unclassified
cytoscapeTelescopeJS
	^ '(function(){
  var wsUri = "ws://" + location.hostname + ":1701";
  
  function init() {

    visuDivs = obtainAllVisualizationDivs();

    visus = [];

    for(var i in visuDivs){
      visus.push({divId: visuDivs[i], visu:createVisu(visuDivs[i])});
    }
    
    console.log(visus);
    
    websocket = new WebSocket(wsUri);
    parametrizeWebsocket(visuDivs);
  }
  
  function createVisu(aDivId){
    return cytoscape({
      container: document.getElementById(aDivId)
    });
  }
  
  function visuWithId(aVisuId){
    for(var i in visus){
      if(visus[i].divId == aVisuId)
            return visus[i].visu;
    }

  }
  
  function obtainAllVisualizationDivs(){
   ids = [];
   $( "div" ).each(function(){
     if(this.getAttribute(''isTelescopeVisu'') == ''true''){
     
     ids.push(this.getAttribute(''id''));
       
     }
     });
   return ids;
  }
  

  function parametrizeWebsocket() {
    
    websocket.onopen = function(evt) { onOpen(evt, visuDivs); };
    websocket.onclose = function(evt) { onClose(evt); };
    websocket.onmessage = function(evt) { onMessage(evt); };
    websocket.onerror = function(evt) { onError(evt); };
  }

  function onOpen(evt) {
    messages = [];
    for (var i in visuDivs)
      messages.push({id:visuDivs[i], command:"generate"});

    websocket.send(JSON.stringify(messages));
  }

  function onClose(evt) {
   
  }

  function onMessage(evt) {
    commands = JSON.parse(evt.data);
    console.log(commands);
    for(var i in commands)
      {
        command = commands[i];
        console.log(command);
        if(command.command == "add"){
         console.log(command.parameters);
         (visuWithId(command.visuId)).add(command.parameters);
        }
      }
  }

  function onError(evt) {
     }


  window.addEventListener("load", init, false);
})();'