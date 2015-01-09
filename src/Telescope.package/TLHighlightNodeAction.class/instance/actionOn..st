action
actionOn: aTLDrawable
	(aTLDrawable state at: #highlighted ifAbsentPut: [false])
		ifFalse: [ self highlight: aTLDrawable ]
		ifTrue: [ self unhighlight: aTLDrawable ].
	