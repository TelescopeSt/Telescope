accessing
attachPoint
	attachPoint ifNil: [ attachPoint := self defaultAttachPoint ].
	^ attachPoint