position
relativePositionToParentNodeOrAbsolute
	^ self position
		+
			(self parent
				ifNil: [ 0 @ 0 ]
				ifNotNil: [ 
					self parent isNode
						ifTrue: [ self parent compositeMargin ]
						ifFalse: [ self parent relativePositionToParentNodeOrAbsolute ] ])