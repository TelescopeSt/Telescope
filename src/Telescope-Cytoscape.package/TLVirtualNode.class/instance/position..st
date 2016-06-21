accessing
position: anObject
	self userFixedPosition
		ifFalse: [ position := anObject ].
	self clearEncompassingRectangle