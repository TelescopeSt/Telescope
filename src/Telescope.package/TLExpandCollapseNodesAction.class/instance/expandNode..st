action
expandNode: aNode
	| children newNodes targetNodes |
	children := self obtainExpandNodesFrom: aNode.
	children
		ifNotEmpty: [ 
			newNodes := TLDrawableCollection new.
			self parentToChildren
				at: aNode
				put:
					(children
						ifNotNil: [ 
							targetNodes := self obtainNodesWhereNew: newNodes FromEntities: children withOriginNode: aNode.
							newNodes ]).
			expandToOrigin
				ifFalse: [ aNode connectToAll: targetNodes ]
				ifTrue: [ targetNodes connectTo: aNode ].
			aNode state at: #expanded put: true ]