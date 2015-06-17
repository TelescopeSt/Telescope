consistency-dictionaries
registerInteraction: aTLInteraction withTrigger: aTLTrigger onDrawable: aTLDrawable 
	self registerInteraction: aTLInteraction onDrawable: aTLDrawable.
	self triggerForInteractionAndDrawable at: aTLInteraction -> aTLDrawable put: aTLTrigger.