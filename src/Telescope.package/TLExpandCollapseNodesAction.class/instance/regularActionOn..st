action
regularActionOn: aNode
	| newNodes targetNodes children |
	(children := self obtain: self property on: aNode entity) isCollection
		ifFalse: [ TLWrongUsedFunctionalityException signal: 'The property of the ExpandCollapseNodesAction should be a collection.' ].
	children
		ifNotEmpty: [ 
			newNodes := TLDrawableCollection new.
			targetNodes := self obtainNodesWhereNew: newNodes fromEntities: children withOriginNode: aNode.
			self parentToChildren at: aNode put: newNodes.
			expandToOrigin
				ifFalse: [ aNode connectIfNotToAll: targetNodes ]
				ifTrue: [ targetNodes connectIfNotTo: aNode ].
			self connectNewNodes: newNodes toExistingOnesInVisu: aNode visualization.
			aNode state at: self expandIdentifier put: true ]