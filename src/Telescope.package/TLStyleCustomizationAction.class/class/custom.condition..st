as yet unclassified
custom: aBlock condition: condition
	^ self new
		customizationBlock: [ aBlock select: condition ];
		yourself