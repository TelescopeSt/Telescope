accessing
parent: aParent
	| oldParent |
	oldParent := parent.
	oldParent ifNotNil: [ oldParent removeChild: self ].
	aParent ifNotNil: [ aParent addChild: self ].
	parent := aParent.
	oldParent = parent
		ifFalse: [ 
			self hierarchyHasChanged.
			oldParent ifNotNil: [ oldParent hierarchyHasChanged ] ].
	self requireUpdateAndLayoutApplication