as yet unclassified
printOn: aStream
	self fromNode printOn: aStream.
	aStream << '->'.
	self toNode printOn: aStream.