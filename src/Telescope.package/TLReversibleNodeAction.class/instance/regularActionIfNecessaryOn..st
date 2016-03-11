action
regularActionIfNecessaryOn: aTLDrawable
	(self shouldTriggerReverseActionFor: aTLDrawable)
		ifFalse: [ self regularActionOn: aTLDrawable ]