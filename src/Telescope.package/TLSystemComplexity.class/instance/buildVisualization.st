building
buildVisualization
	self styleSheet expandCompositeNodes.
	self styleSheet backgroundColor: Color veryPaleRed.
	(self container ifNil: [ self styleSheet > #roots ] ifNotNil: [ self styleSheet > #children > #roots ])
		width: [ :c | c numberOfVariables * 5 max: 5 ];
		height: [ :c | c numberOfMethods max: 5 ];
		backgroundColor:
				(RTGrayLinearColor new
						command: #linesOfCode;
						scope: self root withAllSubclasses);
		borderColor: Color black.
	(self container
		ifNotNil: [ 
			(self roots groupedBy: self container)
				keysAndValuesDo: [ :aContainer :children | (self > #default addCompositeNodeFromEntity: aContainer children: children) childrenLayout: RTTreeLayout ].
			(self > #default) allChildrenNodes ]
		ifNil: [ 
			(self > #default)
				layout: RTTreeLayout;
				addNodesFromEntities: self roots;
				yourself ])
		addStyle: #roots;
		connectFollowingProperty: self property