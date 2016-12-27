action
regularActionOn: aDrawable
	(self previousStyleDictionary at: aDrawable put: (self obtainTargetDrawablesFrom: aDrawable))
		do: [ :aTargetDrawable | self customize: aTargetDrawable ]