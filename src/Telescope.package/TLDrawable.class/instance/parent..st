accessing
parent: aParent
	| oldParent |
	oldParent := parent.
	parent := aParent.
	oldParent ifNotNil: [ oldParent removeChild: self ].
	aParent ifNotNil: [ aParent addChild: self ].
	self requireUpdateAndLayoutApplication.
	