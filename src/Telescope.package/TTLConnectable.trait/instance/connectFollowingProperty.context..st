connect
connectFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup
	^ self flatCollect: [ :tlEntity | tlEntity connectFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup ]