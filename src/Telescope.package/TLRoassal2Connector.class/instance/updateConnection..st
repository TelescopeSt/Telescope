as yet unclassified
updateConnection: aConnection
	super updateConnection: aConnection.
	(self elementFromTLDrawable: aConnection) trachelShape pushFront