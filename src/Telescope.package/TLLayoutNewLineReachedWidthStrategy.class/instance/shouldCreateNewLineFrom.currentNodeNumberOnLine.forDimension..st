strategy
shouldCreateNewLineFrom: currentPosition currentNodeNumberOnLine: anInteger forDimension: nodeDimension
	^ self maxWidth < (currentPosition x + nodeDimension x)