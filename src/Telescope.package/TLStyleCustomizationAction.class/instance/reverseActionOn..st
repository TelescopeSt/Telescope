action
reverseActionOn: aTLDrawable
	(self previousStyleDictionary at: aTLDrawable) do: [ :aTargetDrawable | self removeCustomization: aTargetDrawable ].
	self previousStyleDictionary removeKey: aTLDrawable