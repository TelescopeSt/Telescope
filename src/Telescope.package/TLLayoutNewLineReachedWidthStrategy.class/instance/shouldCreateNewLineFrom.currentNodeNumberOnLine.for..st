strategy
shouldCreateNewLineFrom: currentPosition currentNodeNumberOnLine: anInteger for: nextElement
	^ self maxWidth < (currentPosition x + nextElement width)