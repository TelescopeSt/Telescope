action
reverseActionOn: aTLDrawable
	(self hiddedDrawables at: aTLDrawable) select: #isVisible thenDo: #show.
	self hiddedDrawables removeKey: aTLDrawable