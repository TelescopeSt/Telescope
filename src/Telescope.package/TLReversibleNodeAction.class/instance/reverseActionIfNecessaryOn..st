action
reverseActionIfNecessaryOn: aTLDrawable
	(self shouldTriggerReverseActionFor: aTLDrawable)
		ifTrue: [ self reverseActionOn: aTLDrawable ]