accessing
fromNode: aNode
	aNode ifNotNil: [ aNode addOutgoingConnection: self ].
	fromNode := aNode