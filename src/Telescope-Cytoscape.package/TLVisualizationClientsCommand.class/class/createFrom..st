instance-creation
createFrom: aJsonDictionary
	
	^ ({ 'generate' -> TLVisualizationGenerationCommand . 'interaction' -> TLInteractionCommand . 'menuInteraction' -> TLMenuInteractionCommand } asDictionary at: (aJsonDictionary at: #command)) newWithParameters: aJsonDictionary