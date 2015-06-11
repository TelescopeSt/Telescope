updating - connection
updateEdgeOf: aConnection
	| edge |
	edge := self elementFromTLDrawable: aConnection.
	aConnection hasEntity
		ifTrue: [edge model: aConnection entity].
	edge update