generation - node
customizeShape: aShape withStyleSheet: aStyleSheet

	self flag: 'Should not be done like that.'.
	
	(aShape isKindOf: RTLabel) ifFalse: [ aShape
		borderColor: aStyleSheet borderColor;
		borderWidth: aStyleSheet borderWidth;
		width: aStyleSheet width;
		color: aStyleSheet backgroundColor.
	] ifTrue: [ 
	aShape color: aStyleSheet color.
	self flag: 'this way i have to always set the color'.
].

	aShape height: aStyleSheet height.