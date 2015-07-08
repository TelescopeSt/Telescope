updating - connection
updateConnection: aConnection
	|shape|
	
	shape := (self elementFromTLDrawable: aConnection).
	
	aConnection isUpdateRequired ifTrue: [
		[self updateInteractionsOf: aConnection.
		self updateEdgeOf: aConnection.
		self customizeEdgeShape: shape withStyleSheet: aConnection effectiveStyleSheet.
		aConnection updateDone] on: KeyNotFound do: [ aConnection generate ]
	].
	shape trachelShape pushFront