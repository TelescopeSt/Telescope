action
reverseActionOn: aTLDrawable
	(self obtainTargetDrawablesFrom: aTLDrawable) do: [ :aTargetDrawable | self removeCustomization: aTargetDrawable ]