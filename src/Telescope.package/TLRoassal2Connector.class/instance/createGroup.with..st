generation - group
createGroup: aCollection with: anObject
	| group |
	group := RTGroup newFrom: aCollection.
	^ group