as yet unclassified
printOn: aStream
	super printOn: aStream.
	aStream
		<< $(;
		<< self realNode entity asString;
		<< $)