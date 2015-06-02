building
buildVisualization
	(self > #containers) nodeBackgroundColor: Color white.
	(self > #containers) nodeChildrenProperty: self innerEntities.
	((self > #containers) styleSheet > #children) backgroundColor: self createColorBlock.
	(self > #containers) styleSheet nodeLabel: [:e | e name asString] position: #top.
	self > #containers addNodesFromEntities: self containerEntities.
	self legend: (TLLegend on: (self > #containers) allChildrenNodes label: [:entity | (property perform: entity) asString])