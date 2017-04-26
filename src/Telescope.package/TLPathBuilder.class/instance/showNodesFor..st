building
showNodesFor: aNode
	(self > #incomingCalls) removeAll.
	(self > #outgoingCalls) removeAll.
	self > #incomingCalls addAbsentNodesInVisualizationFromEntities: (self incomingBlock value: aNode entity).
	self > #incomingCalls connectTo: aNode.
	self > #outgoingCalls addAbsentNodesInVisualizationFromEntities: (self outgoingBlock value: aNode entity).
	aNode connectTo: (self > #outgoingCalls)