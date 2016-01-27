as yet unclassified
freeResourcesFor: webSocket
	self websocketByVisu
		keysAndValuesRemove: [ :aVisu :aWebSocket | 
			aWebSocket = webSocket
				ifTrue: [ 
					self visualizationByIdDictionary removeKey: (self visualizationByIdDictionary keyAtValue: aVisu).
					true ]
				ifFalse: [ false ] ]