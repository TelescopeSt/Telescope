accessing
action: aTLAction
	self assert: aTLAction isMultiChoiceAction description: 'A TLMultiChoiceMenuInteraction require a TLMultiChoiceAction'.
	super action: aTLAction