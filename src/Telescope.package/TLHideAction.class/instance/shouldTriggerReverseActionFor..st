testing
shouldTriggerReverseActionFor: aTLDrawable
	self hiddedDrawables at: aTLDrawable ifAbsent: [ ^ false ].
	^ true