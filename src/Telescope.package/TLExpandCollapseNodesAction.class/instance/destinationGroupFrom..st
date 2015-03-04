as yet unclassified
destinationGroupFrom: node
	^ self destinationGroup ifNil: [ node parent ]