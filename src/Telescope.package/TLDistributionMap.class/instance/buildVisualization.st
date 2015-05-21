building
buildVisualization
	self > #containers nodeBuilder: TLCompositeNodeBuilder new.
	(self > #containers) nodeBackgroundColor: Color white.
	(self > #containers) nodeChildrenProperty: self innerEntities.
	((self > #containers) styleSheet > #children) backgroundColor: self createColorBlock.
	(self > #containers) styleSheet nodeLabel: #name position: #top.
	(self > #containers) nodeBuilder childrenNodeBuilder addInteraction: TLNodeBasicInteraction popup.
	self > #containers addNodesFromEntities: self containerEntities.
	self buildLegend