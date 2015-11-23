accessing
roots
	self requirePropertyApplication
		ifTrue: [ self feedRootsFrom: self root withProperty: self property ].
	^ roots