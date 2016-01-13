updating - connection
updateEdgeOf: aConnection
	| edge shape |
	shape := (self elementFromTLDrawable: aConnection).
	
	edge := self elementFromTLDrawable: aConnection.
	aConnection hasEntity
		ifTrue: [edge model: aConnection entity].
	edge update.
	self customizeEdgeShape: shape withStyleSheet: aConnection effectiveStyleSheet.