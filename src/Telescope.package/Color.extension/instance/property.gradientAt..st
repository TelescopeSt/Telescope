*Telescope-Style
property: aBlockOrProperty gradientAt: aLevel
	^ TLGradient new
		levelProperty: aBlockOrProperty;
		to: self at: aLevel;
		yourself