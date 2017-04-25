Description
------------------
A TLMoveConnectableAction is an action that move a connectable (node or group into another group).

Public API and Key Messages
------------------

- #destinationGroup:  aGroup  			The group where the drawable should move.

 Examples
-----------------

	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet nodeLabel: #asString.
	visualization > #group1
		layout: TLLinearLayout topToBottom;
		addNodesFromEntities: ($a to: $d);
		addInteraction: (TLMoveConnectableAction destination: visualization > #group2) onClick.
	visualization > #group2
		layout: TLLinearLayout topToBottom;
		addNodesFromEntities: ($e to: $h);
		addInteraction: (TLMoveConnectableAction destination: visualization > #group1) onClick.
	^ visualization
	
Internal Representation and Key Implementation Points.
-----------------

    Instance Variables
	destinationGroup:				<aTLGroup>		The destination group for the drawables