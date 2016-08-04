instance-creation
createFrom: aJsonDictionary
	^ ({('generate' -> TLVisualizationGenerationCommand).
	('interaction' -> TLInteractionCommand).
	('menuInteraction' -> TLMenuInteractionCommand).
	('multiMenuInteraction' -> TLMultiChoicesMenuInteractionCommand).
	('moveNode' -> TLNodeMovedCommand).
	('dropNode' -> TLDropNodeCommand)} asDictionary at: (aJsonDictionary at: #command)) newWithParameters: aJsonDictionary