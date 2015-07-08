action
customize: aTLDrawable
	self previousStyleDictionary at: aTLDrawable put: aTLDrawable styleSheet.
	aTLDrawable styleSheet: aTLDrawable styleSheet copy.
	self customizationBlock value: aTLDrawable styleSheet.
	aTLDrawable state at: self stateKey put: true.
	aTLDrawable requireUpdate.