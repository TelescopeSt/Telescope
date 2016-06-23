action
regularActionOn: aTLDrawable
	(self obtainTargetDrawablesFrom: aTLDrawable) do: [ :aTargetDrawable | self customize: aTargetDrawable ]