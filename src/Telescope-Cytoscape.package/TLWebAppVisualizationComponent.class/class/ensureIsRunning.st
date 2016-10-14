as yet unclassified
ensureIsRunning
	(WAAdmin isAnAppRegisteredAt: 'UserVisualisation')
		ifFalse:[self initialize]