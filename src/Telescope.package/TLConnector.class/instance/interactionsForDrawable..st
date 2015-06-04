consistency-dictionaries
interactionsForDrawable: aTLCompositeNode 
	^ self interactionsByDrawable at: aTLCompositeNode ifAbsent: [#()].