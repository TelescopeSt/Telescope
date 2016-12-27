testing
shouldTriggerReverseActionFor: aTLDrawable
	^ aTLDrawable state at: self actionPropertySymbol ifAbsent: [ false ]