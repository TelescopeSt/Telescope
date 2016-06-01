interactions
withMultipleChoices: aBlockOrCollection menu: aTitle displayBlock: aBlock
	^ (self withMultipleChoices: aBlockOrCollection menu: aTitle)
		displayBlock: aBlock;
		yourself