as yet unclassified
absolutePosition
		
	^ self position
		+
			(self parent
				ifNil: [ 0 @ 0 ]
				ifNotNil: [ 
					self parent isNode
						ifTrue: [ self parent compositeMargin + self parent upperLeftAbsolutePosition ] 
						ifFalse: [ self parent upperLeftAbsolutePosition ] ])