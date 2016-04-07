accessing
newLineStrategy
	^ newLineStrategy ifNil: [ newLineStrategy := TLLayoutNewLineReachedDimensionStrategy dimension: Float infinity ]