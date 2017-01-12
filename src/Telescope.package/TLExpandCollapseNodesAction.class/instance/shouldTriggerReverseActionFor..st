testing
shouldTriggerReverseActionFor: aNode
	^ aNode state at: self expandIdentifier ifAbsent: [ false ]