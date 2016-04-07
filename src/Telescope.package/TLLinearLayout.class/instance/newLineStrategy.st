accessing
newLineStrategy
	^ newLineStrategy ifNil: [ newLineStrategy := TLLayoutNewLineReachedWidthStrategy width: 400 ]