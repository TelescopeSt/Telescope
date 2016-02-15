action
actionOn: aTLDrawable
	| targetDrawable |
	targetDrawable := self target ifNotNil: [ self target value: aTLDrawable ] ifNil: [ aTLDrawable ].
	(targetDrawable as: TLDrawableCollection)
		do: [ :aTargetDrawable | 
			(aTargetDrawable state includesKey: self stateKey)
				ifFalse: [ self customize: aTargetDrawable ]
				ifTrue: [ self removeCustomization: aTargetDrawable ] ]