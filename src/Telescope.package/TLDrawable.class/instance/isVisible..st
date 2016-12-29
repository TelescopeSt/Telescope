accessing
isVisible: aBoolean
	isVisible ~= aBoolean
		ifTrue: [ 
			isVisible := aBoolean.
			self requireUpdateAndLayoutApplication ]
		ifFalse: [ isVisible := aBoolean ]