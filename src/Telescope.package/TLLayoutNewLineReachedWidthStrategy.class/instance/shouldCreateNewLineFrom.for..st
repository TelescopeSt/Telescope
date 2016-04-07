strategy
shouldCreateNewLineFrom: currentPosition for: nextElement
	^ self maxWidth < (currentPosition x + nextElement width)