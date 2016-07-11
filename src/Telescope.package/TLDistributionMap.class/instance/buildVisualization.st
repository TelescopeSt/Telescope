building
buildVisualization
	self > #containers nodeBackgroundColor: Color white.
	self > #containers nodeChildrenProperty: self innerEntities.
	(self > #containers) styleSheet > #children backgroundColor: self createColorBlock.
	(self > #containers) styleSheet nodeLabel: [ :e | e name asString ] position: #top.
	((self > #containers) styleSheet > #children) noNodeLabel.
	self > #containers addNodesFromEntities: self containerEntities.
	(self > #containers) allChildrenNodes addInteraction: TLPopUpAction onMouseOver.
	self legend
		backGroundDescription: [ :drawable | (property cull: drawable entity) asString ]
		forNodes: (self > #containers) allChildrenNodes