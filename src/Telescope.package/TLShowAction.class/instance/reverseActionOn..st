action
reverseActionOn: aTLDrawable
	(self shownDrawables at: aTLDrawable) select: #isVisible thenDo: #hide.
	self shownDrawables removeKey: aTLDrawable