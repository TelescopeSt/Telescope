testing
shouldOccursOn: aKindOfInteraction 
	^ self kind = aKindOfInteraction and: [ self condition isNotNil  ]