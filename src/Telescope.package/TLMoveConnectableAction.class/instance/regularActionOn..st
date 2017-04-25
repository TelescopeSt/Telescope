action
regularActionOn: aTLDrawable
	aTLDrawable state at: self stateKey put: aTLDrawable parent.
	aTLDrawable moveToGroup: self destinationGroup