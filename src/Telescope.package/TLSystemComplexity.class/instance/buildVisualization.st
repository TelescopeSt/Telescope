building
buildVisualization
	self styleSheet
		expandCompositeNodes;
		backgroundColor: Color veryPaleRed.
	self styleSheet > #connection > #head shape: TLNoShape.
	(self container ifNil: [ self styleSheet > #roots ] ifNotNil: [ self styleSheet > #children > #roots ])
		width: [ :c | c instVarNames size * 5 max: 5 ];
		height: [ :c | c numberOfMethods max: 5 ];
		backgroundColor: ((MDLColor black property: #linesOfCode gradientAt: 1) to: MDLColor white at: (self roots collect: #linesOfCode) max);
		borderColor: Color black.
	(self container
		ifNotNil: [ :c | 
	(self roots groupedBy: c)
		keysAndValuesDo: [ :aContainer :children | 
			(self > #default addCompositeNodeFromEntity: aContainer children: children)
				childrenLayout:
					(TLTreeLayout new
						useOutgoingLinks;
						yourself) ].
	(self > #default) allChildrenNodes ]
		ifNil: [ (self > #default)
				layout:
					(TLTreeLayout new
						useOutgoingLinks;
						yourself);
				addNodesFromEntities: self roots;
				yourself ])
		addStyle: #roots;
		connectFollowingProperty: self property