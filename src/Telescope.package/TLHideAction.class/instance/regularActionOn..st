action
regularActionOn: aTLDrawable
	self hiddedDrawables
		at: aTLDrawable
		put:
			(([ self hidingValuableOrEntity value: aTLDrawable ]
				on: MessageNotUnderstood
				do: [ self hidingValuableOrEntity ]) asOrderedCollection select: #isVisible).
	(self hiddedDrawables at: aTLDrawable) do: [ :aDrawableToHide | aDrawableToHide hide ]