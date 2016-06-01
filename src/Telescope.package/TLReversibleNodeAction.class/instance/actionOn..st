action
actionOn: aTLDrawable
	(self obtainTargetDrawablesFrom: aTLDrawable)
		do: [ :aTargetDrawable | 
			(self shouldTriggerReverseActionFor: aTargetDrawable)
				ifTrue: [ self reverseActionOn: aTargetDrawable ]
				ifFalse: [ self regularActionOn: aTargetDrawable ] ]