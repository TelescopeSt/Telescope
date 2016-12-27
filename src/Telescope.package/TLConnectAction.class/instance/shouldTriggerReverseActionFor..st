testing
shouldTriggerReverseActionFor: aNode
	^ self connectionsByNode at: aNode ifPresent: [ :c | true ] ifAbsent: [ false ]