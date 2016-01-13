accessing
width: aWidth
	aWidth = TLLabelBasedWidth ifFalse: [ self shape width: aWidth]