action
expandNode: aNode
	| children newNodes targetNodes |
	children := self obtainExpandNodesFrom: aNode.
	children
		ifNotEmpty: [ 
			newNodes := TLDrawableCollection new.
			targetNodes := self obtainNodesWhereNew: newNodes FromEntities: children withOriginNode: aNode.
			self parentToChildren
				at: aNode
				put:
					
							newNodes .
			expandToOrigin
				ifFalse: [ aNode connectToAll: targetNodes ]
				ifTrue: [ targetNodes connectTo: aNode ].
			aNode state at: #expanded put: true ]