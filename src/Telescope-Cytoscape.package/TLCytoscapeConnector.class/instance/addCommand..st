commands
addCommand: aTLVisualizationServerCommand
	aTLVisualizationServerCommand isAddingCommand
		ifFalse: [ self commandsQueue addLast: aTLVisualizationServerCommand ]
		ifTrue: [ 
			(self commandsQueue isEmpty or: [ self commandsQueue last isMultiAdding not ])
				ifTrue: [ self commandsQueue addLast: (TLVisualizationMultiAddingCommand new visuId: self visuId)].
			self commandsQueue last addAddingCommand: aTLVisualizationServerCommand ]