destination
destinationGroupFor: entity byDefault: aGroup
	^ self destinationGroup ifNotNil: [ self obtain: self destinationGroup on: entity ] ifNil: [ aGroup ]