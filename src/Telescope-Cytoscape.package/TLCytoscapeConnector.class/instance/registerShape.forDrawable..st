accessing
registerShape: element forDrawable: aDrawable
	super registerShape: element forDrawable: aDrawable.
	[ 
	self drawablesById
		at:
			(element isString
				ifTrue: [ element ]
				ifFalse: [ element id ])
		put: aDrawable ]
		on: MessageNotUnderstood
		do: [  ]