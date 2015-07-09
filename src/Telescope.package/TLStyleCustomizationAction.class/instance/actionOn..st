action
actionOn: aTLDrawable
	(aTLDrawable state includesKey: self stateKey)
		ifFalse: [ self customize: aTLDrawable ]
		ifTrue: [ self removeCustomization: aTLDrawable ].
	