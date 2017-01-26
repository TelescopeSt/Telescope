libs
cytoscapeTelescopeJs
	^ 'var telescope = (function () {
  var wsUri = "ws://" + location.hostname + ":1701";
  var websocket;
  var timeoutId; //use to delais interaction
  var toNotifyMessage={};
  var self = {};
  var tryReconnect=true;
  //time in ms before an event like mouse over.
  self.reactTime=150;

  function visuWithId(aVisuId) {
    for (var i in visus) {
      if (visus[i].visuId == aVisuId)
        return visus[i].visu;
    }
  }

  function loadVisuIn(htmlElement) {
    visuDivs = htmlElement.getElementsByClassName("telescopeVisu");
    for (var i = 0; i < visuDivs.length; i++) {
      visus.push({visuId: visuDivs[i].getAttribute("id"), visu: createVisu(visuDivs[i])});
    }

    parametrizeWebsocket(visus);

    for (var j in visus)
      parametrizeInteractionsListenerForVisu(visus[j]);
  }

  function init() {
    self.visus = [];
    visus= self.visus; // make closure as soon as possible to clean API
    waitingDivByVisu = [];
    loadVisuIn(document, websocket);
  }

  function createVisu(visuDiv) {
    //Here we remove the second child which is the waiting display and store it for future waiting
    waitingDivByVisu[visuDiv.getAttribute("id")] = visuDiv.getElementsByClassName("tlWaiting")[0];
    //visuDiv.removeChild(waitingDivByVisu[aDivId]);
    return cytoscape({
      container: visuDiv.firstChild,
      layout: {name: "preset"}
    });
  }


  function calculateNodesPositionsWithLayout(layout, nodes) {

  }

  function parametrizeWebsocket(visus) {
    websocket = new WebSocket(wsUri);

    websocket.onclose = function (evt) {
      onClose(evt);
    };
    websocket.onmessage = function (evt) {
      onMessage(evt);
    };
    websocket.onerror = function (evt) {
      onError(evt);
    };
    if (websocket.readyState == 0) {
      websocket.onopen = function (evt) {
        onOpen(evt, visus);
      };
    } else {
      onOpen(null, visus);
    }
  }

  function onOpen(evt, visus) {
    messages = [];
    for (var i in visus)
      if(document.getElementById(visus[i].visuId)!=null)
        messages.push({id: visus[i].visuId, command: "generate"});

    websocket.send(JSON.stringify(messages));
  }

  function onClose(evt) {
    if(tryReconnect){
      console.log("retry connection");
      parametrizeWebsocket(visus);
    }
  }

  function removeWaitingForVisuId(aVisuId) {
    try {
      waitingDivByVisu[aVisuId].parentNode.removeChild(waitingDivByVisu[aVisuId]);
      waitingDivByVisu[aVisuId]=null;
    } catch (err) {
      //Here the waiting has been removed a previous time
    }
  }

  commandsAction = {};
  commandsActionBatch ={};
  handleServerError={};

  function toBacthCommand(command, visu,toUpdate){
    toUpdate[command.visuId]= toUpdate[command.visuId] || [];
    toUpdate[command.visuId].push(command);
  }

  commandsAction.add = function (command, visu) {
    elements = visu.add(command.parameters);
    for (var elementId = 0; elementId < elements.length; elementId++) {
      customizeElement(elements[elementId], command.parameters[elementId]);
    }
  };

  commandsAction.remove = toBacthCommand;
  commandsActionBatch.remove=function(command,visu){
    visu.remove(visu.getElementById(command.nodeId));
  };

  commandsAction.positioning = function (command, visu) {
    visu.layout(command.layout);
  };

  commandsAction.customize = toBacthCommand;
  commandsActionBatch.customize=function(command,visu){
    visu.getElementById(command.elementId).style(command.style);
  };

  commandsAction.addStaticLegendEntry = function (command) {
    addStaticLegendEntry(command.visuId, command.html);
  };

  commandsAction.removeLegend = function (command) {
    $("#" + command.visuId + "legend").remove();
  };

  commandsAction.refreshNode = function (command, visu) {
   setTimeout(function(){ visu.$("#" + command.data.id).changeData(command.data);}, 3000);
  };

  commandsAction.callback = function (command, visu) {
    sendCallBack(command.callbackUrl, command.openInNewTab);
  };

  commandsAction.generated = function (command) {
    removeWaitingForVisuId(command.visuId);
  }

  commandsAction.error = function (command) {
    if(handleServerError[command.detail]){
      handleServerError[command.detail](command);//usefull to display messages
    }else if(waitingDivByVisu[command.visuId] != null){
      waitingDivByVisu[command.visuId].innerHTML= "An Error has occured."
      notify("An Error has occured");
      console.log("message error have no display");
      console.log(command);
    }
    onError();//generic handle Error
  }

  handleServerError.noVisu= function(command){
    notify("An Error has occured: "+command.visuId+ " was not found.");
    waitingDivByVisu[command.visuId].innerHTML= "<h1>"+command.message+"</h1>"
  }

  function customizeAll(toUpdate){
    visuIDs= Object.keys(toUpdate);
    for ( var i = 0; i<visuIDs.length ; i ++){
      cmds=toUpdate[visuIDs[i]];
      visu = visuWithId(visuIDs[i]);
      visu.startBatch();
      for( var j = 0; j<cmds.length ; j ++){
        commandsActionBatch[cmds[j].command](cmds[j],visu);
      }
      visu.endBatch();
    }
  }

  function onMessage(evt) {
    commands = JSON.parse(evt.data);
    toUpdate = {};
    needNotify = {};
    for (var i in commands) {
      command = commands[i];
      if(needNotify[command.visuId]){
         needNotify[command.visuId]=true;
      }
      visu = visuWithId(command.visuId);
      if (commandsAction[command.command]) {
         commandsAction[command.command](command, visu,toUpdate);
      } else {
        console.log("unsupported command: " + command.command);
        console.log(command);
      }
    }
    //customize in one visu rendering all element toUpdate
    customizeAll(toUpdate);
    needNotify= Object.keys(needNotify);
    for(i=0;i<needNotify.length;i++){
      notifyMessageEnd(needNotify[i]);
    }
    notifyMessageEnd("onAll");
  }

  function post(path, cbId, openInNewTab) {
    var form = $("<form></form>", {method: "post", action: path});
    if (openInNewTab) {
      form.attr("target", "_blank");
    }

    var field = $("<input>", {type: "hidden", name: cbId, value: "refresh"});
    form.append(field);

    // The form needs to be a part of the document in
    // order for us to be able to submit it.
    $(document.body).append(form);
    form.submit();
  }

  function sendCallBack(callBackUrl, openInNewTab) {
    post(callBackUrl[0], callBackUrl[1], openInNewTab);
  }

  function customizeElement(element, commandParametersForElement) {
    // here we define the attribute for mouse over to avoid sending request to the server if unnecessary
    if ((commandParametersForElement.mouseOverInteraction !== null))
      element["mouseOverInteraction"] = commandParametersForElement.mouseOverInteraction;
    // here we define the attribute for mouse over to avoid sending request to the server if unnecessary
    if ((commandParametersForElement.dropInteraction !== null))
      element["dropInteraction"] = commandParametersForElement.dropInteraction;
    // here we define a popup if the element has one
    if (commandParametersForElement.popUp) {
      element.popUp=commandParametersForElement.popUp;
      element.qtip(commandParametersForElement.popUp);
    }
    // here we define a menu if element has one
    if (commandParametersForElement.menu) {
      element["menu"] = commandParametersForElement.menu;
    }
  }

  function addStaticLegendEntry(visuId, html) {
    var div = document.getElementById(visuId + "legend");
    if (!div) {
      div = $("<div>", {id: visuId + "legend", class: "tlLegend"})
              .html("<table></table>")[0];
      document.getElementById(visuId).appendChild(div);
    }
    div.firstChild.insertRow(-1).innerHTML = html;
  }

  function onError(evt) {
    tryReconnect=false;
  }


  function displayMenuForElement(element, visuId, position) {
    var menu = [];
    var fun = function (name, evt) {
      websocket.send(JSON.stringify([
        {"id": visuId,
          "drawableId": element.id(),
          "command": "menuInteraction",
          "kind": "menu",
          "entry": ($(evt.target).index() + 1)
        }]));
    };

    var subFun = function (name, evt) {
      var selected = evt.currentTarget;
      websocket.send(JSON.stringify([
        {"id": visuId,
          "drawableId": element.id(),
          "command": "multiMenuInteraction",
          "kind": "menu",
          "entry": ($(selected.parentNode.parentNode).index() + 1),
          "selection": ($(selected).index() + 1)
        }]));
    };

    for (var i = 0; i < element.menu.length; i++) {
      entry = {name: element.menu[i].title, title: element.menu[i].title};

      if (element.menu[i].subMenu) {
        entry["subMenu"] = [];
        for (var j = 0; j < element.menu[i].subMenu.length; j++) {
          var subMenuTitle = element.menu[i].subMenu[j];
          entry["subMenu"].push({name: subMenuTitle, title: subMenuTitle, fun: subFun});
        }
      } else {
        entry["fun"] = fun;
      }
      menu.push(entry);
    }
    $("#" + visuId).contextMenu(menu);
    //Should remove old menu
    $("#" + visuId).contextMenu("open", {top: position.y, left: position.x});
  }

  function useExternalTrigger(evt, visuId, triggerId) {
    websocket.send(JSON.stringify([{id: visuId, command: "externalTrigger", triggerId:triggerId, kind: (eventsWithInteractions[evt.type]|| evt.type)}]));
  }

  eventsWithInteractions = {"tap": "click", "cxttap": "rightClick", "mouseover": "mouseOver", "mouseout": "mouseOut"};

  function clearOverInteraction(){
    if(timeoutId!=null){
      clearTimeout(timeoutId);
      timeoutId=null;
    }
  }

  function createEventFunction(visuWithId) {
    return function (evt) {
      clearOverInteraction();
      if(evt.cyTarget.id != null){
        // server interaction processing
        if ((!evt.cyTarget["mouseOverInteraction"]) && ((evt.type == "mouseover") || (evt.type == "mouseout"))) {

        } else {
        // menu management
          if (evt.type == "cxttap" && evt.cyTarget["menu"]) {
            displayMenuForElement(evt.cyTarget, visuWithId.visuId, {x: evt.originalEvent.clientX, y: evt.originalEvent.clientY});
          }
          websocket.send(JSON.stringify([{id: visuWithId.visuId, drawableId: evt.cyTarget.id(), command: "interaction", kind: (eventsWithInteractions[evt.type])}]));
        }
      }
    };
  }

   function  delaisEvtFunction(evtFunction) {
    return function (evt) {
      clearOverInteraction();
      timeoutId = setTimeout(function() {
        evt.cyTarget.onmouseover= null;
        evtFunction(evt);
      }, self.reactTime);
    };
  }

  function isDropActionOnANode(visuWithId, candidates, pos, droppedNode) {
    var target;

    for (i = 0; i < candidates.length; i++) {
      var node = candidates[i];
      var bound = node.renderedBoundingBox();
      if (node != droppedNode && bound.x1 < pos.x && bound.x2 > pos.x && bound.y1 < pos.y && bound.y2 > pos.y) {
        //here we found a node correctly positionned and *WARNING* we keep the last one so with the closest zIndex
        target = node;
      }
    }

    // if we found a target and this one has a drop interaction then we request the server
    if (target && target.dropInteraction) {
      websocket.send(JSON.stringify([{id: visuWithId.visuId, nodeId: droppedNode.id(), command: "dropNode", targetNode: target.id()}]));
      return true;
    } else
      return false;
  }

  function createDragEventFunction(visuWithId) {
    return function (evt) {
      //We only send a moveNode command if it is not considered as a drop
      if (!isDropActionOnANode(visuWithId, evt.cy.elements(), this.renderedPosition(), evt.cyTarget))
        websocket.send(JSON.stringify([{id: visuWithId.visuId, nodeId: evt.cyTarget.id(), command: "moveNode", position: evt.cyTarget.position()}]));
    };
  }

  function parametrizeInteractionsListenerForVisu(visuWithId) {
    evtFunction= createEventFunction(visuWithId)
    evtFunctionWithDelais= delaisEvtFunction(evtFunction);
    visuWithId.visu.on("tap mouseout cxttap",  evtFunction);
    visuWithId.visu.on("mouseover", evtFunctionWithDelais);
    visuWithId.visu.on("free", "node", createDragEventFunction(visuWithId));
  }

  window.addEventListener("load", init, false);

  //extend collection to redraw a node with new data like change parent
  function changeData(newData) {
    var self = this;
    visu = self.cy();
    newNode = {group: self.group(),
      position: self.position(),
      data: newData,
      style: self.style()
    };
    commandParametersForElement={
      mouseOverInteraction: self[0]["mouseOverInteraction"] ,
      dropInteraction: self[0]["dropInteraction"],
      menu: self[0]["menu"],
      popUp: self[0]["popUp"]
    };
    edges = self.connectedEdges();
    children= self.children();//visu.$("#"+newData.id+" *");
    self.remove();
    toCustomize=visu.add(newNode);
    customizeElement(toCustomize, commandParametersForElement);
    edges.restore();
    children.restore();
  }

  /* useful for test with mocha
   * callback parameter : ()
   */
  function onMessageEnd(callback, id){
    if(id !=null){
       if(toNotifyMessage[id] ==null)
         toNotifyMessage[id] =  [ ]
       toNotifyMessage[id].push(callback);
    }else {
      onMessageEnd(callback, "onAll");
    }
  }


  function removeMessageEnd(callback, id, optArrToAdd){
    if(id !=null){
       if(toNotifyMessage[id] ==null)
         return;
       toNotifyMessage[id].splice( toNotifyMessage[id].indexOf(callback), 1 );
    }else {
      removeMessageEnd(callback, "onAll");
    }
  }

  function notifyMessageEnd(visuId){
    if(toNotifyMessage[visuId] ==null)
      toNotifyMessage[visuId] =  [ ]
    for(i=0; i< toNotifyMessage.onAll.length;i++){
      console.log(toNotifyMessage[visuId],i);
      toNotifyMessage[visuId][i]();
    }
  }

  function enableUserNotification() {
    function showNot(message){
      new Notification(message)
    }

    if ( !( "Notification" in window ) ) {
      return;
    } else if ( Notification.permission === "granted" ) {
       notify=showNot;
    } else if ( Notification.permission !== "denied" ) {
      Notification.requestPermission( function ( permission ) {
        if ( permission === "granted" ) {
           notify=showNot;
        } else {
          return ;
        }
      } );
    } else {
      return ;
    }
  };

  function disableUserNotification() {
    notify= function(message) {
      console.log(message)
    }
  }

  var notify;
  enableUserNotification();

  cytoscape("collection", "changeData", changeData);

  self.useExternalTrigger = useExternalTrigger;
  self.visuWithId = visuWithId;
  self.loadVisuIn = loadVisuIn;
  self.onMessageEnd = onMessageEnd;
  self.removeMessageEnd = removeMessageEnd;
  self.enableUserNotification = enableUserNotification;
  self.disableUserNotification = disableUserNotification;

  return self;
})();

visuWithId = function (id) {
  console.log("visuWithId is deprecated. Use telescope.visuWithId instead.");
  return telescope.visuWithId(id);
};'