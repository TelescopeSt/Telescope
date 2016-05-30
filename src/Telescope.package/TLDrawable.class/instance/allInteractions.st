interactions
allInteractions
	"return the local interactions and interactions inherited from the parent"

	^ (self parent
		ifNil: [ #() ]
		ifNotNil: [ 
			self parent isNode
				ifTrue: [ self parent allInheritedInteractions ]
				ifFalse: [ self parent allInteractions ] ]) , self interactions