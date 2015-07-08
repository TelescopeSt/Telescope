action
actionOn: aTLDrawable
	(aTLDrawable state at: self stateKey ifAbsentPut: [false])
		ifFalse: [ self customize: aTLDrawable ]
		ifTrue: [ self removeCustomization: aTLDrawable ].
	