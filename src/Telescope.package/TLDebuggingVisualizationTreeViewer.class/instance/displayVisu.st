building
displayVisu
	(self addNodeFromEntity: anotherVisualization) styleSheet nodeLabel: 'Visualization'; backgroundColor: MDLColor deepOrange.
	(self addNodesFromEntities: anotherVisualization allNodesRecursively)
		do: [ :aNode | 
			aNode
				addStyle:
					(aNode entity isComposite
						ifTrue: [ #compositeNode ]
						ifFalse: [ #simpleNode ]) ].
	self styleSheet > #parentRelation color: MDLColor blue.
	self styleSheet > #compositeParentRelation color: MDLColor green.
	(self connectFollowingProperty: #parent) addStyle: #parentRelation.
	(self connectFollowingProperty: #parentNode) addStyle: #compositeParentRelation.
	self layout: TLTreeLayout new.
	self styleSheet nodeLabel: [ :node | node entity asString ].
	self styleSheet > #simpleNode backgroundColor: MDLColor yellow.
	self styleSheet > #compositeNode backgroundColor: MDLColor orange.
	self legend backGroundDescription: [ :node | node class asString ].