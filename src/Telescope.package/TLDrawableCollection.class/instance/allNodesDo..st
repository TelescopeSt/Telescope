enumerating
allNodesDo: aBlock
	^ self
		do: [ :aTLEntity | 
			aTLEntity isNode
				ifTrue: [ aBlock value: aTLEntity ]
				ifFalse: [ aTLEntity allNodesDo: aBlock ] ]