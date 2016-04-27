libs
cytoscapeTelescopeJs
	^ '(function(){
  var wsUri = "ws://" + location.hostname + ":1701";
  
  function init() {

    visuDivs = obtainAllVisualizationDivs();

    visus = [];
    
    waitingDivByVisu = [];
    
    for(var i in visuDivs){
      visus.push({visuId: visuDivs[i], visu:createVisu(visuDivs[i])});
    }
    
    websocket = new WebSocket(wsUri);
    parametrizeWebsocket(visuDivs);
    
    for(var j in visus)
      parametrizeInteractionsListenerForVisu(visus[j]);
  }
  
  function createVisu(aDivId){
    
    visuDiv = document.getElementById(aDivId);
    
    //Here we remove the second child which is the waiting display and store it for future waiting
    waitingDivByVisu[aDivId]=visuDiv.getElementsByClassName(''tlWaiting'')[0];
    //visuDiv.removeChild(waitingDivByVisu[aDivId]);
    
    return cytoscape({
      
      container: visuDiv.firstChild,
      layout: {name: ''preset''}
    });
  }
  
  function visuWithId(aVisuId){
    for(var i in visus){
      if(visus[i].visuId == aVisuId)
            return visus[i].visu;
    }

  }
  
  function calculateNodesPositionsWithLayout(layout, nodes){
    
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
  
  function removeWaitingForVisuId(aVisuId){
    try{
      visuDiv = document.getElementById(aVisuId);
      visuDiv.removeChild(waitingDivByVisu[aVisuId]);
    }catch(err){
      //Here the waiting has been removed a previous time
    }
  }

  function onMessage(evt) {
    commands = JSON.parse(evt.data);
    
    for(var i in commands)
      {
        command = commands[i];
        visu = visuWithId(command.visuId);
        if(command.command == "add"){
          elements = visu.add(command.parameters);
          for(var elementId = 0; elementId < elements.length;elementId++){
            customizeElement(elements[elementId],command.parameters[elementId]);
            
           
          }
        } else if(command.command == "remove"){
          visu.remove(visu.getElementById(command.nodeId));
        } else if(command.command == "positioning"){
          //ensure min zoom is small to make unzoom possible for layout
          visu.minZoom(visu.zoom()/1000);
          visu.layout(command.layout);
          //define the min zoom to avoid getting too far
          visu.minZoom(visu.zoom()/2);
        } else if(command.command == ''customize''){
          visu.getElementById(command.elementId).style(command.style);
        } else if(command.command == ''addStaticLegendEntry''){
          addStaticLegendEntry(command.visuId,command.html);
        } else if(command.command == ''removeLegend''){
          removeLegend(command.visuId);
        } else if(command.command == ''callback''){
          sendCallBack(command.callbackUrl, command.openInNewTab);
        }
        else {
          console.log("unsupported command: " + command.command);
          console.log(command);
        }
      }
    removeWaitingForVisuId(commands[0].visuId);
    
  }
  
  function post(path, cbId, openInNewTab) {
	 var form = $(''<form></form>'');

    form.attr("method", "post");
    form.attr("action", path);
    if(openInNewTab){
      form.attr("target", "_blank");
    } 

   var field = $(''<input></input>'');

   field.attr("type", "hidden");
    field.attr("name", cbId);
     field.attr("value", ''refresh'');

     form.append(field);
    
    // The form needs to be a part of the document in
    // order for us to be able to submit it.
    $(document.body).append(form);
    form.submit();
}
  
  function sendCallBack(callBackUrl,openInNewTab){
    post(callBackUrl[0], callBackUrl[1], openInNewTab);
  }
  
  function customizeElement(element, commandParametersForElement){
    element[''mouseOverInteraction''] = commandParametersForElement.mouseOverInteraction;
    // here we define a popup if the element has one
    if(commandParametersForElement.popUp){
      element.qtip(commandParametersForElement.popUp);
    }
    // here we define a menu if element has one
    if(commandParametersForElement.menu){
      element[''menu''] = commandParametersForElement.menu;
    }
  }
  
  function removeLegend(visuId){
    var div = document.getElementById(visuId+''legend'');
    if(div) {
      div.parentNode.removeChild(div); 
    }
  }
  
  function addStaticLegendEntry(visuId,html){
    var div = document.getElementById(visuId+''legend'');
    if(!div) {
      div = document.createElement(''div'');
      div.id = visuId+''legend'';
      div.className = ''tlLegend'';
      div.innerHTML=''<table></table>'';
      document.getElementById(visuId).appendChild(div);}
    div.firstChild.insertRow(-1).innerHTML = html;
  }

  function onError(evt) {
     }

  function displayMenuForElement(element, visuId, position){
    var menu = [];
    var fun = function (name, evt){
        websocket.send(JSON.stringify([
          {"id": visuId, 
          "drawableId": element.id(),
          "command": "menuInteraction",
          "kind": "menu",
          "entry": evt.target.innerHTML
          }]));};
    
    
    for(var i = 0; i < element.menu.length; i++){
      
      menu.push({name: element.menu[i], title: element.menu[i], fun: fun});
    }
     $(''#''+visuId).contextMenu(menu);//element[''menu''];
    $(''#''+visuId).contextMenu(''open'', {top: position.y, left: position.x});
  }

  function createEventFunction(visuWithId){
    eventsWithInteractions = {''tap'':''click'' , ''cxttap'':''rightClick'' , ''mouseover'':''mouseOver'', ''mouseout'':''mouseOut''};
    
    return function (evt){
      // server interaction processing
      if((!evt.cyTarget[''mouseOverInteraction'']) && ((evt.type == ''mouseover'') || (evt.type == ''mouseout''))){
          
      }
      else{
        // menu management
        if(evt.type == ''cxttap'' && evt.cyTarget[''menu'']){
          displayMenuForElement(evt.cyTarget, visuWithId.visuId,{ x:evt.originalEvent.clientX , y: evt.originalEvent.clientY});
        }
        
        websocket.send(JSON.stringify([{id:visuWithId.visuId, drawableId:evt.cyTarget.id(),command:"interaction",kind:(eventsWithInteractions[evt.type])}]));
      }
    };
  }

  function parametrizeInteractionsListenerForVisu(visuWithId){
    
    visuWithId.visu.on(''tap mouseover mouseout cxttap'',''node'',createEventFunction(visuWithId));
    visuWithId.visu.on(''tap mouseover mouseout cxttap'',''edge'',createEventFunction(visuWithId));
    
  }


  window.addEventListener("load", init, false);
})();'