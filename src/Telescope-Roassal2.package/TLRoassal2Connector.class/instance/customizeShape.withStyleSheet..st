generation - node
customizeShape: aShape withStyleSheet: aStyleSheet
	self flag: 'Should not be done like that.'.
	(aShape isKindOf: RTLabel)
		ifFalse: [ 
			aShape
				borderColor: aStyleSheet borderColor;
				borderWidth: aStyleSheet borderWidth;
				width: aStyleSheet width;
				color: aStyleSheet backgroundColor.
			aShape isComposite
				ifTrue: [ 
					aShape labelPosition: aStyleSheet nodeLabelPosition forRoassal2.
					aShape textColor: aStyleSheet textColor.
					aShape labelShape text: aStyleSheet nodeLabel 
					] ]
		ifTrue: [ 
			aShape color: aStyleSheet textColor.
			aShape text: aStyleSheet nodeLabel.
			self flag: 'this way i have to always set the color' ].
	aShape height: aStyleSheet height