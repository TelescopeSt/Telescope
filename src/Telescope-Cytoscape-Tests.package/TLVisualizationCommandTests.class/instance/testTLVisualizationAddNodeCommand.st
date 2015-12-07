tests
testTLVisualizationAddNodeCommand
	| command |
	command := TLVisualizationAddNodeCommand new nodeId: '5'; visuId: '42'.
	self assert: (NeoJSONWriter toString: command) equals: '{"command":"add","visuId":"42","parameters":{"data":{"id":"5"},"group":"nodes"}}'