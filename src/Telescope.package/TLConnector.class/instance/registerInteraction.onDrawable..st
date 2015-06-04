consistency-dictionaries
registerInteraction: aTLInteraction onDrawable: aTLDrawable 
	(self interactionsByDrawable at: aTLDrawable ifAbsentPut: [OrderedCollection new]) add: aTLInteraction.