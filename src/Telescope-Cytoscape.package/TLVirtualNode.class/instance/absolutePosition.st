as yet unclassified
absolutePosition
	^ self hasParent
		ifFalse: [ self position ]
		ifTrue: [ self parent absolutePosition + self position + self compositeMargin ]