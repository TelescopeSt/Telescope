building
buildVisualization
	self > #containers nodeBuilder: TLCompositeNodeBuilder new.
	(self > #containers) nodeBuilder backgroundColor: Color white.
	(self > #containers) nodeBuilder childrenProperty: self innerEntities.
	(self > #containers) nodeBuilder childrenNodeBuilder backgroundColor: self createColorBlock.
	(self > #containers) nodeBuilder nodeLabel: #name position: #top.
	(self > #containers) nodeBuilder childrenNodeBuilder addInteraction: TLNodeBasicInteraction popup.
	self > #containers addNodesFromEntities: self containerEntities.
	self buildLegend