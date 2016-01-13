accessing
parentNode
	^ self parent ifNotNil: [ self parent isNode ifTrue: [ self parent ] ifFalse: [self parent parentNode]]