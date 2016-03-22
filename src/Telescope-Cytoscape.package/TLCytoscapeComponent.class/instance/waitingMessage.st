accessing
waitingMessage
	^ waitingMessage ifNil: [ self defaultWaitingHtml ]