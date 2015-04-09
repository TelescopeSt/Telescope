as yet unclassified
expandNode: aNode
	| children newNodes  targetNodes |
	children := self property rtValue: aNode entity.
	newNodes := TLDrawableCollection new.
	self parentToChildren
		at: aNode
		put:
			(children
				ifNotNil: [ 
					targetNodes := children collect: [:aChild | (self destinationGroupFrom: aChild) nodeForEntity: aChild ifAbsent: [newNodes add: ((self destinationGroupFrom: aChild) addNodeFromEntity: aChild) ]] as: TLDrawableCollection.
				newNodes	]).
	expandToOrigin
		ifFalse: [ 
			aNode connectToAll: targetNodes ]
		ifTrue: [ 
			targetNodes connectTo: aNode ].
	aNode state at: #expanded put: true