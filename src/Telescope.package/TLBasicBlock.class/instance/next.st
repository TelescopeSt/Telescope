accessing
next
	next ifNil: [ self next: OrderedCollection new ].
	^ next