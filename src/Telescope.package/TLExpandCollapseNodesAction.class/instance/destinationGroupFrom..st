as yet unclassified
destinationGroupFrom: node
	^ self destinationGroup ifNotNil: [ self destinationGroup rtValue: node ] ifNil: [ node parent ]