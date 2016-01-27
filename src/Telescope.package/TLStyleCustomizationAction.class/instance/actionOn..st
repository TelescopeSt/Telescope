action
actionOn: aTLDrawable
	| targetDrawable |
	targetDrawable := self target ifNotNil: [ self target value: aTLDrawable ] ifNil: [ aTLDrawable ].
	(targetDrawable state includesKey: self stateKey)
		ifFalse: [ self customize: targetDrawable ]
		ifTrue: [ self removeCustomization: targetDrawable ]