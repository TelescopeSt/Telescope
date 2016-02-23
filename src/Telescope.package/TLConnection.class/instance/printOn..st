printing
printOn: aStream
	super printOn: aStream.
	aStream << ':('.
	self fromNode printOn: aStream.
	aStream << '->'.
	self toNode printOn: aStream.
	aStream << ')'