as yet unclassified
testConnectionCreation
	| anotherNode visualization |
	visualization := TLVisualization new.
	visualization addDrawable: node.
	anotherNode := TLSimpleNode new.
	visualization addDrawable: anotherNode.
	node connectTo: anotherNode.
	self assert: node outgoingConnections size equals: 1.
	self assert: anotherNode incomingConnections size equals: 1.
	self assert: node outgoingConnections first equals: anotherNode incomingConnections first