generation - group
createGroup: aTLGroup with: aCollection
	| group |
	group := RTGroup newFrom: aCollection.
	^ group