action
expandNode: aNode
	| children newNodes targetNodes |
	children := self obtainExpandEntitiesFrom: aNode.
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