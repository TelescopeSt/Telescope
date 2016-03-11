testing
shouldTriggerReverseActionFor: aTLDrawable 
	self flag: 'Should not use an all interaction common key'.
	^ (aTLDrawable state includesKey: self stateKey)
	