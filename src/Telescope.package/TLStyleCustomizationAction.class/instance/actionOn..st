as yet unclassified
actionOn: aTLDrawable
	(self obtainTargetDrawablesFrom: aTLDrawable)
		do: [ :aTargetDrawable | 
			(self shouldTriggerReverseActionFor: aTargetDrawable)
				ifTrue: [ self removeCustomization: aTargetDrawable ]
				ifFalse: [ self customize: aTargetDrawable ] ]