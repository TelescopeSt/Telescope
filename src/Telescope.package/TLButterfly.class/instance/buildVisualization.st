building
buildVisualization
	|  leftEntitiesValues rightEntitiesValues |
	self styleSheet nodeLabel: #name.
	leftEntitiesValues := (self leftEntities rtValue: self mainEntity) asOrderedCollection.
	rightEntitiesValues := (self rightEntities rtValue: self mainEntity) asOrderedCollection.
	self > #left addNodesFromEntities: leftEntitiesValues.
	self > #central addNodeFromEntity: self mainEntity.
	self > #right addNodesFromEntities: rightEntitiesValues.
	(self > #left) connectTo: (self > #central).
	(self > #central) connectTo: (self > #right).
	