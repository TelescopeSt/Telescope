pager-instance creation
lowColor: aMDLColor highColor: aMDLColor2 levelProperty: aString range: aRange
	^ (self lowColor: aMDLColor highColor: aMDLColor2 levelProperty: aString)
		lowLevel: aRange first;
		highLevel: aRange last;
		yourself