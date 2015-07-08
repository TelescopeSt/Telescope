action
removeCustomization: aTLDrawable
	aTLDrawable styleSheet: (self previousStyleDictionary at: aTLDrawable).
	aTLDrawable state at: self stateKey put: false.
	aTLDrawable requireUpdate.