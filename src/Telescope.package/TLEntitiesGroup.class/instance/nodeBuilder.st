accessing
nodeBuilder
	^ nodeBuilder ifNotNil: [ nodeBuilder ] ifNil: [ self parent nodeBuilder ].
