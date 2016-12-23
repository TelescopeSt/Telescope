testing
shouldTriggerReverseActionFor: aTLDrawable
	self shownDrawables at: aTLDrawable ifAbsent: [ ^ false ].
	^ true