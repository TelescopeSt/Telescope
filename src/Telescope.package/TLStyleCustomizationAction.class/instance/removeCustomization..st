action
removeCustomization: aTLDrawable
	aTLDrawable styleSheet: (aTLDrawable state removeKey: self stateKey) .
	aTLDrawable requireUpdate.