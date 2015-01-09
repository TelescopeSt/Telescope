action
highlight: aTLDrawable
	self previousBorderColorDictionary at: aTLDrawable put: aTLDrawable shape borderColor.
	aTLDrawable shape borderColor: Color red.
	aTLDrawable state at: #highlighted put: true.
	aTLDrawable requireUpdate.