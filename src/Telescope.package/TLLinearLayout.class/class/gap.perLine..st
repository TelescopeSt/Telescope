instance-creation
gap: aGap perLine: anInteger
	^ (self gap: aGap)
		newLineStrategy: (TLLayoutNewLineMaxNumberElementsStrategy maxNumberOfElements: anInteger);
		yourself