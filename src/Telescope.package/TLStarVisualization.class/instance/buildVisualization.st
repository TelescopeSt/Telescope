building
buildVisualization
	self styleSheet nodeLabel: #asString position: #insideCentered.
	self styleSheet shape: TLEllipse.
	self buildInteractionActions.
	self > #around addNodesFromEntities: (self aroundNodes value: self centerNode).
	self > #center connectTo: self > #around.
	self layout: self clusterLayout