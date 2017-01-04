action
regularActionOn: aTLDrawable
	(self hiddedDrawables
		at: aTLDrawable
		put: (self obtain: self hidingValuableOrEntity on: aTLDrawable) asOrderedCollection) do: #hide