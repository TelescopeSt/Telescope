instance-creation
createFrom: aJsonDictionary
	
	^ ({ 'generate' -> TLVisualizationGenerationCommand . 'interaction' -> TLInteractionCommand } asDictionary at: (aJsonDictionary at: #command)) newWithParameters: aJsonDictionary