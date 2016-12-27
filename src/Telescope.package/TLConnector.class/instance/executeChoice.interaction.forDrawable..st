execution-interaction
executeChoice: aChoiceIndex interaction: anInteraction forDrawable: aTLDrawable
	self
		executeInteraction: anInteraction
		parameter: ((anInteraction choicesListForDrawable: aTLDrawable) at: aChoiceIndex)
		forDrawable: aTLDrawable