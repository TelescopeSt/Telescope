updating - connection
updateEdgeOf: aConnection
	| edge |
	edge := self elementFromTLDrawable: aConnection.
	edge model: aConnection entity.
	edge update