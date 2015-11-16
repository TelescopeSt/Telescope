accessing
nodeCreationStrategy
	^ nodeCreationStrategy ifNil: [ self parent nodeCreationStrategy ]