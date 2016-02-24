accessing
absolutePosition
	"A VirtualNode will always have a group as parent. We take the upper left position of the parent because the layouts will place nodes regarding on it."

	^ self hasParent
		ifTrue: [ self position + self parent upperLeftAbsolutePosition ]
		ifFalse: [ self position ]