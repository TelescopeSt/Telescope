instance-creation
gap: aGap maximumWidth: aWidth
	^ (self gap: aGap)
		newLineStrategy: (TLLayoutNewLineReachedWidthStrategy width: aWidth);
		yourself