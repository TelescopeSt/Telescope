as yet unclassified
initialize
	super initialize.
	self visualizationByIdDictionary: Dictionary new.
	self visuByWebsocket: Dictionary new.
	self handler: [ :webSocket | [webSocket runWith: [ :message | self onMessageReceived: message webSocket: webSocket ]] on: ConnectionClosed do: [ self freeResourcesFor: webSocket ] ]