action
reverseActionOn: aTLDrawable
	(self previousStyleDictionary removeKey: aTLDrawable)
		do: [ :aTargetDrawable | self removeCustomization: aTargetDrawable ]