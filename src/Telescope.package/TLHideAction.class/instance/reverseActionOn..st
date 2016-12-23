action
reverseActionOn: aTLDrawable
	(self hiddedDrawables at: aTLDrawable)
		do: [ :aDrawableToHide | 
			aDrawableToHide isVisible
				ifFalse: [ aDrawableToHide show ] ].
	self hiddedDrawables removeKey: aTLDrawable