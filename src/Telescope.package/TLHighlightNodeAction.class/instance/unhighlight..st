action
unhighlight: aTLDrawable
	aTLDrawable shape borderColor: (self previousBorderColorDictionary at: aTLDrawable).
	aTLDrawable state at: #highlighted put: false.
	aTLDrawable requireUpdate.