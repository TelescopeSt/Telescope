private
moveInCenter: aNode
	(self > #center) removeAll.
	aNode moveToGroup: (self > #center).
	(self > #around) removeAll.
	self > #around addNodesFromEntities: (self aroundNodes value: aNode entity).
	self > #center connectTo: self > #around.
	self layout: self clusterLayout.
	self update