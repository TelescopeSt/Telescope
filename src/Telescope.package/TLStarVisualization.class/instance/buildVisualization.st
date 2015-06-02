building
buildVisualization
	self styleSheet nodeLabel: #mooseName position: #insideCentered.
	self buildInteractionActions.
	self > #around addNodesFromEntities: (self aroundNodes value: self centerNode).
	self > #center connectTo: self > #around.
	self layout: self clusterLayout