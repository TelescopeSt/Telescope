destination
destinationGroupFor: entity byDefault: aGroup
	^ self destinationGroup ifNotNil: [ self destinationGroup rtValue: entity ] ifNil: [ aGroup ]