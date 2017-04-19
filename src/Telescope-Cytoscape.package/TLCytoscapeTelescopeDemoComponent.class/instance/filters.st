accessing
filters
	^ filters ifNil: [ filters := TLAbstractDemoFilter allSubclasses asOrderedCollection ]