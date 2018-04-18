instance creation
withAll: aCollectionOfStrategies
	^ self new
		addStrategies: aCollectionOfStrategies;
		yourself