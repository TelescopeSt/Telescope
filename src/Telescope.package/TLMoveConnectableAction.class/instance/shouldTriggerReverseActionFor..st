testing
shouldTriggerReverseActionFor: aTLDrawable
	^ aTLDrawable state at: self stateKey ifPresent: [ true ] ifAbsent: [ false ]