execution-interaction
executeChoice: aChoiceIndex interaction: anInteraction forDrawable: aTLDrawable
	| visualization |
	visualization := aTLDrawable visualization.	"we have to memorize the visualization because we are not sure the element will still be part of visualization after action"
	anInteraction actionOn: aTLDrawable choice: ((anInteraction choicesListForDrawable: aTLDrawable) at: aChoiceIndex).
	visualization update