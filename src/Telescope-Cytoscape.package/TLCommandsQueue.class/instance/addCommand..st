as yet unclassified
addCommand: aTLVisualizationServerCommand
	aTLVisualizationServerCommand isAddingCommand
		ifFalse: [ self removingCustomizingCommands addLast: aTLVisualizationServerCommand ]
		ifTrue: [ self addingCommand addAddingCommand: aTLVisualizationServerCommand ]