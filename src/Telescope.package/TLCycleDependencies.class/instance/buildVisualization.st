building
buildVisualization

	| cycleCalculator |
	cycleCalculator := MalTarjan new.
	cycleCalculator nodes: self entities.
	cycleCalculator edges: self entities 
		from: #yourself
		toAll: self property.
	cycleCalculator run.

	( self > #packages ) styleSheet
		width: self widthBlock;
		height: self heightBlock;
		backgroundColor: [ :namespace | 
			(cycleCalculator findNode: namespace) isInCycle
				ifTrue: [ Color red ]
				ifFalse: [ Color white ] ].
			
	self edgeBuilder color: Color veryLightGray.

	self > #packages
		addNodesFromEntities: self entities;
		connectFollowingProperty: self property;
		addInteraction: TLNodeBasicInteraction popup;
		addInteraction: TLNodeBasicInteraction draggable;
		layout: RTCircleLayout.
