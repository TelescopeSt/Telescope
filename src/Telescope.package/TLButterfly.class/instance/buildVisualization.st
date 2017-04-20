building
buildVisualization
	| leftEntitiesValues rightEntitiesValues |
	self styleSheet nodeLabel: #asString.
	leftEntitiesValues := (self obtain: self leftEntities on: self mainEntity) asOrderedCollection.
	rightEntitiesValues := (self obtain: self rightEntities on: self mainEntity) asOrderedCollection.
	self > #left addNodesFromEntities: leftEntitiesValues.
	self > #central addNodeFromEntity: self mainEntity.
	self > #right addNodesFromEntities: rightEntitiesValues.
	self > #left connectTo: self > #central.
	self > #central connectTo: self > #right.
	self configLabelPosition