as yet unclassified
testGenerateSimpleNode
	| tlNode tlShape roassalShape rtElement interactions connections |
	tlNode := protocol mock: 'tlNode'.
	tlShape := protocol mock: 'tlShape'.
	roassalShape := protocol mock: 'roassalShape'.
	rtElement := protocol mock: 'rtElement'.
	interactions := protocol mock: 'interactions'.
	connections := protocol mock: 'connections'.
	protocol describe once: tlNode recv: #shape; => tlShape.
	protocol describe once: tlShape recv: #generateWith:; => roassalShape.
	protocol describe once: tlNode recv: #entity.
	protocol describe once: roassalShape recv: #elementOn:; => rtElement.
	protocol describe once: view recv: #add:; with: rtElement.
	protocol describe once: tlNode recv: #allInteractions; => interactions.
	protocol describe once: interactions recv: #select:thenDo:.
	protocol describe once: tlNode recv: #incomingConnections; => connections.
	protocol describe once: tlNode recv: #outgoingConnections; => connections.
	protocol describe twice: connections recv: #do:.
	connector generateSimpleNode: tlNode.