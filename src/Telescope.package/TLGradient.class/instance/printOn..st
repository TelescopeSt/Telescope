as yet unclassified
printOn: aStream
	super printOn: aStream.
	aStream
		<< $(;
		<< self levelProperty;
		<< $)