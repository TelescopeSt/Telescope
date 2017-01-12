accessing
parentNode
	^ (self parent isNil or: [ self parent isNode ])
		ifTrue: [ self parent ]
		ifFalse: [ self parent parentNode ]