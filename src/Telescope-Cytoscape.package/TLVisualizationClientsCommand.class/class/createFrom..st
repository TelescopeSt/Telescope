instance-creation
createFrom: aJsonDictionary
	^ ({('generate' -> TLVisualizationGenerationCommand).
	('interaction' -> TLInteractionCommand).
	('menuInteraction' -> TLMenuInteractionCommand).
	('multiMenuInteraction' -> TLMultiChoicesMenuInteractionCommand).
	('moveNode' -> TLNodeMovedCommand).
	('dropNode' -> TLDropNodeCommand).
	('externalTrigger' -> TLExternalTriggerCommand)} asDictionary at: (aJsonDictionary at: #command)) newWithParameters: aJsonDictionary