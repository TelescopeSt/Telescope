instance-creation
createFrom: aJsonDictionary
	
	^ ({ 'generate' -> TLVisualizationGenerationCommand . 'interaction' -> TLInteractionCommand . 'menuInteraction' -> TLMenuInteractionCommand . 'multiMenuInteraction' -> TLMultiChoicesMenuInteractionCommand} asDictionary at: (aJsonDictionary at: #command)) newWithParameters: aJsonDictionary