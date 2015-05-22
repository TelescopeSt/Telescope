connect
connectThrough: connectionsValuable to: targetValuable context: aTLEntitiesGroup
	^ self flatCollect: [ :tlEntity | tlEntity connectThrough: connectionsValuable to: targetValuable context: aTLEntitiesGroup ]