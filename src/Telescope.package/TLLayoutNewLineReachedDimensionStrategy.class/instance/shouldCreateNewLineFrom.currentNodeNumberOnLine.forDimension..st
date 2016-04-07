strategy
shouldCreateNewLineFrom: currentPosition currentNodeNumberOnLine: anInteger forDimension: nodeDimension
	^ self maxDimension < (currentPosition x + nodeDimension x)