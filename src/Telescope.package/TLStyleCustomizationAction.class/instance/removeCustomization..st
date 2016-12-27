action
removeCustomization: aDrawable
	aDrawable styleSheet: (aDrawable state removeKey: self stateKey).
	aDrawable requireUpdate