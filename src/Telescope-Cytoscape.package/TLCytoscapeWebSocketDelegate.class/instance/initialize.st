as yet unclassified
initialize
	super initialize.
	self visualizationByIdDictionary: Dictionary new.
	self handler: [ :webSocket | webSocket runWith: [ :message | self onMessageReceived: message ] ].