action
regularActionOn: aTLDrawable
	self shownDrawables
		at: aTLDrawable
		put:
			(([ self showingValuableOrEntity value: aTLDrawable ]
				on: MessageNotUnderstood
				do: [ self showingValuableOrEntity ]) asOrderedCollection reject: #isVisible).
	('Show: ' , (self shownDrawables at: aTLDrawable) asString) crLog.
	(self shownDrawables at: aTLDrawable) do: #show