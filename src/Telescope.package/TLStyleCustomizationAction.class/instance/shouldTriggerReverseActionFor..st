testing
shouldTriggerReverseActionFor: aTLDrawable
	^ self previousStyleDictionary at: aTLDrawable ifPresent: [ :c | true ] ifAbsent: [ false ]