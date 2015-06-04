consistency-dictionaries
unregisterAllInteractionsForDrawable: aTLShapeTrigger 
	self interactionsByDrawable removeKey: aTLShapeTrigger ifAbsent: [  ]