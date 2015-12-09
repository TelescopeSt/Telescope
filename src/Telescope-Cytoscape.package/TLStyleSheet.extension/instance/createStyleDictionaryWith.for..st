*Telescope-Cytoscape
createStyleDictionaryWith: aCollectionOfProperties for: anEntity
	^ aCollectionOfProperties
		inject: Dictionary new
		into: [ :style :aPropertyAndValuable | 
			[ style at: aPropertyAndValuable key put: (self obtainValue: aPropertyAndValuable value forEntity: anEntity) forCytoscape ]
				on: KeyNotFound
				do: [  ].
			style ]