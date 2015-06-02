connect
connectThrough: connectionsValuable to: targetValuable context: aTLEntitiesGroup
	| targets connectionEntities |
	connectionEntities := connectionsValuable value: self entity.
	targets := connectionEntities
		collect: [ :connectionEntity | connectionEntity -> (targetValuable value: connectionEntity) ].
	^ targets
		inject: OrderedCollection new
		into: [ :collection :connectionAndTarget | 
			[ 
			collection
				add: (self connectToNode: (aTLEntitiesGroup nodeForEntity: connectionAndTarget value) using: self edgeBuilder entity: connectionAndTarget key) ]
				on: NotFound
				do: [  ].
			collection ]