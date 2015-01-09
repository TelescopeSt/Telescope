accessing
toNode: aNode
	aNode ifNotNil: [ aNode addIncomingConnection: self ].
	toNode := aNode