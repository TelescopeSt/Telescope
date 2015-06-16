action
expandNode: aNode
	| children newNodes targetNodes |
	children := self obtainExpandNodesFrom: aNode.
	newNodes := TLDrawableCollection new.
	self parentToChildren
		at: aNode
		put:
			(children
				ifNotNil: [ 
					targetNodes := children
						collect: [ :aChild | 
							(self destinationGroupFor: aChild byDefault: aNode parent)
								nodeForEntity: aChild
								ifAbsent: [ newNodes add: ((self destinationGroupFor: aChild byDefault: aNode parent) addNodeFromEntity: aChild) ] ]
						as: TLDrawableCollection.
					newNodes ]).
	expandToOrigin
		ifFalse: [ aNode connectToAll: targetNodes ]
		ifTrue: [ targetNodes connectTo: aNode ].
	aNode state at: #expanded put: true