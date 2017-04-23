building
buildVisualization
	self > #containers nodeBackgroundColor: Color white.
	self > #containers nodeChildrenProperty: self innerEntities.
	(self > #containers) styleSheet > #children backgroundColor: self createColorBlock.
	(self > #containers) styleSheet nodeLabel: #asString position: #top.
	((self > #containers) styleSheet > #children) noNodeLabel.
	self > #containers addNodesFromEntities: self containerEntities.
	(self > #containers) allChildrenNodes addInteraction: (TLPopUpAction text: [ :entity | self obtain: self innerEntitiesPopupBlock on: entity ]) onMouseOver.
	(self addInteraction: TLExpandCollapseCompositeNodeAction onCompositeNodeWithChildren onClick) propagateToChildren.
	super buildVisualization