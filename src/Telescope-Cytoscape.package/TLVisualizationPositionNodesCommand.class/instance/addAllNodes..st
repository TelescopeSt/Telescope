adding
addAllNodes: aCollectionOfTLVirtualElements
	aCollectionOfTLVirtualElements
		do: [ :anElement | 
			anElement isNode
				ifTrue: [ 
					self nodes add: anElement.
					self addAllNodes: anElement children.
					self addAllTriggers: anElement triggers ] ]