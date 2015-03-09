as yet unclassified
expandNode: aNode
	| children newNodes existingNodes |
	children := self property rtValue: aNode entity.
	newNodes := self parentToChildren
		at: aNode
		put:
			(children
				ifNotNil: [ 
					existingNodes := (self destinationGroupFrom: aNode) nodesForEntities: children.
					(self destinationGroupFrom: aNode) addAbsentNodesInVisualizationFromEntities: children ]).
	expandToOrigin
		ifFalse: [ 
			aNode connectToAll: newNodes.
			aNode connectToAll: existingNodes ]
		ifTrue: [ 
			newNodes connectTo: aNode.
			existingNodes connectTo: aNode ].
	aNode state at: #expanded put: true