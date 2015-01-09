building
buildNodeFromEntity: anEntity
	^ (super buildNodeFromEntity: anEntity)
		expanded: self expandedByDefault;
		property: self childrenProperty;
		childrenNodeBuilder: self childrenNodeBuilder;
		childrenLayout: self childrenLayout;
		childrenConnectingProperty: self childrenConnectingProperty