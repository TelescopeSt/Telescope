testing
shouldOccursOn: aKindOfInteraction with: aDrawable
	^ self kind = aKindOfInteraction and: [ self condition value: aDrawable ]