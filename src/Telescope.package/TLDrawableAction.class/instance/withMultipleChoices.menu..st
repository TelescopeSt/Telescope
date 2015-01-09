interactions
withMultipleChoices: aBlockOrCollection	menu: aTitle
	^ TLMultiChoiceMenuInteraction new title: aTitle; choicesBlock: aBlockOrCollection; action: self 