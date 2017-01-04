action
regularActionOn: aTLDrawable
	(self shownDrawables
		at: aTLDrawable
		put: (self obtain: self showingValuableOrEntity on: aTLDrawable) asOrderedCollection) do: #show