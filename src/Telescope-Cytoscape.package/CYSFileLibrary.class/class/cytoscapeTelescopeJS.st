as yet unclassified
cytoscapeTelescopeJS
	^ '(function(){
  var wsUri = "ws://" + location.hostname + ":1701";
  
  function init() {

    visuDivs = obtainAllVisualizationDivs();

    visus = [];

    for(var i in visuDivs){
      visus.push({visuId: visuDivs[i], visu:createVisu(visuDivs[i])});
    }
    
    websocket = new WebSocket(wsUri);
    parametrizeWebsocket(visuDivs);
    
    for(var j in visus)
      parametrizeInteractionsListenerForVisu(visus[j]);
  }
  
  function createVisu(aDivId){
    return cytoscape({
      container: document.getElementById(aDivId),
      layout: {name: ''preset''}
    });
  }
  
  function visuWithId(aVisuId){
    for(var i in visus){
      if(visus[i].visuId == aVisuId)
            return visus[i].visu;
    }

  }
  
  function keysFor(associativeArray){
    var keys = [];
    for (var key in dictionary) {
      if (dictionary.hasOwnProperty(key)) {
      keys.push(key);
      }
    }
    return keys;
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
    console.log(evt.data);
    commands = JSON.parse(evt.data);
    for(var i in commands)
      {
        command = commands[i];
        visu = visuWithId(command.visuId);
        if(command.command == "add"){
          visu.add(command.parameters);
        } else if(command.command == "remove"){
          visu.remove(visu.getElementById(command.nodeId));
        } else if(command.command == "positioning"){
          visu.layout(command.layout);
        } else {
          console.log("unsupported command: " + command.command);
        }
      }
  }

  function onError(evt) {
     }

  function parametrizeInteractionsListenerForVisu(visuWithId){
    eventsWithInteractions = {''tap'':''click'' , ''mouseover'':''mouseOver''};
    
    visuWithId.visu.on(''tap mouseover'',''node'',function(evt){
      console.log(evt);
        websocket.send(JSON.stringify([{id:visuWithId.visuId, drawableId:evt.cyTarget.id(),command:"interaction",kind:(eventsWithInteractions[evt.type])}]));
    });
    
  }


  window.addEventListener("load", init, false);
})();'