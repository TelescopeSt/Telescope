accessing
isVisible: aBoolean
	isVisible ~= aBoolean ifFalse: [ ^ self ].
	
	isVisible := aBoolean.
	self requireUpdateAndLayoutApplication