node-positioning
managePositioningOf: group
	group ifEmpty: [ ^ self ].
	
	self positionNodesCommand addAllNodes: group