action
customize: aTLDrawable
	aTLDrawable state at: self stateKey put: aTLDrawable styleSheet copy.
	self customizationBlock value: aTLDrawable styleSheet.
	aTLDrawable requireUpdate