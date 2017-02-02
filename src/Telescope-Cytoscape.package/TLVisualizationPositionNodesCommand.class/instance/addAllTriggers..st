adding
addAllTriggers: aCollectionOfTLVirtualTriggers
	aCollectionOfTLVirtualTriggers
		do: [ :aTrigger | 
			aTrigger isNode
				ifTrue: [ self triggers add: aTrigger ] ]