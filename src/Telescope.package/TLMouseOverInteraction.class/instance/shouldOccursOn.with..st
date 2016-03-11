as yet unclassified
shouldOccursOn: aKindOfInteraction with: aDrawable
	^ (self kind = aKindOfInteraction or: [ #mouseOut = aKindOfInteraction ]) and: [ self condition value: aDrawable ]