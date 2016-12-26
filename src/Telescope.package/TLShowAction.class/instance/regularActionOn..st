action
regularActionOn: aTLDrawable
	self shownDrawables
		at: aTLDrawable
		put:
			(([ self showingValuableOrEntity value: aTLDrawable ]
				on: MessageNotUnderstood
				do: [ self showingValuableOrEntity ]) asOrderedCollection reject: #isVisible).
	(self shownDrawables at: aTLDrawable) do: #show