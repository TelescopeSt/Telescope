building
buildVisualization
	self styleSheet
		width: self widthBlock;
		height: self heightBlock;
		backgroundColor:
				(RTGrayLinearColor new
						command: self backgroundColorBlock;
						scope: ( self scopeBlock value: self roots ));
		borderColor: Color black.
	self > #default addNodesFromEntities: self roots.
	self > #default connectFollowingProperty: self property.
	self > #default layout: RTTreeLayout.
	