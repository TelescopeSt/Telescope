Class {
	#name : #TLVisualizationCommandTests,
	#superclass : #TestCase,
	#category : 'Telescope-Cytoscape-Tests-Commands'
}

{ #category : #tests }
TLVisualizationCommandTests >> setUp [
	self crLog: testSelector.
]

{ #category : #tests }
TLVisualizationCommandTests >> testTLVisualizationAddEdgeCommand [
	| command |
	command := TLVisualizationAddEdgeCommand new edgeId: '5'; visuId: '42'; fromNodeId: 'sourceNode'; toNodeId: 'targetNode'; yourself.
	self assert: (NeoJSONWriter toString: command) equals: '{"command":"add","visuId":"42","parameters":{"data":{"target":"targetNode","id":"5","source":"sourceNode"},"group":"edges"}}'
	
]
