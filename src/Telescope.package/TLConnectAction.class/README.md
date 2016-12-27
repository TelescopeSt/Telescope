Description
------------------
A TLConnectAction is an action that will connect entities following a property.

The regular action will create connections and update the visualisation while the reverse action will remove those connections and update the visualisation. 

The user have the choice of the arrow direction via the #connectToOrigin property.

Public API and Key Messages
------------------

- #property: aBlock  			This block return the list of entities to connect to a node. (It should return the entities and not the nodes)
- #context: aCollection 		This collection contain the list of elements that might be linked to the node.  
-#connectToOrigin: aValuable 	ConnectToOrigin allow to know if the connection should be from the node or go to the node. It can be a boolean or a block taking the current node as parameter. If it return true, then the link will go to the node. 

 Examples
-----------------

	| visu |
	(visu := TLVisualization new)
		addNodesFromEntities: (1 to: 60);
		nodeLabel: #asString.
	visu
		addInteraction:
			((TLConnectAction property: [ :n | (1 to: 60) copyWithout: n ] context: visu allNodes) connectToOrigin: #even)
				onMouseOver.
	^ visu
	
	
	| visu |
	(visu := TLVisualization new)
		addNodesFromEntities: (1 to: 60);
		nodeLabel: #asString.
	visu
		addInteraction:
			(TLConnectAction property: [ :n | (1 to: 60) copyWithout: n ]  context: (visu allNodes first: 30))
				onMouseOver.
	^ visu
	
Internal Representation and Key Implementation Points.
-----------------

    Instance Variables
	connectToOrigin:			<aValuable> 		Used to know if the connection should go from the node with the interaction or should go to the node with the interaction.
	connectionsByNode:		<aDictionary>	Only used internaly, this dictionary keep for each node the connections it created in order to reverse the action.
	context:					<aCollection>	A collection of nodes that can be connected. It should be view as the scope of the interaction.
	property:				<aValuable>		This block allow to know which nodes should be connected to the node with the interaction. 