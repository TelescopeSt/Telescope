as yet unclassified
createFrom: aJsonDictionary
	^ ({ 'generate' -> TLVisualizationGenerationCommand } asDictionary at: (aJsonDictionary at: #command)) newWithParameters: aJsonDictionary