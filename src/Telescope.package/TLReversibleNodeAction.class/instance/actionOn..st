action
actionOn: aTLDrawable
	(self shouldTriggerReverseActionFor: aTLDrawable)
		ifTrue: [ self reverseActionOn: aTLDrawable ]
		ifFalse: [ self regularActionOn: aTLDrawable ]