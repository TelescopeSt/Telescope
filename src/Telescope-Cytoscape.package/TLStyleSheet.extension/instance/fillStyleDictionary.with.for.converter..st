*Telescope-Cytoscape
fillStyleDictionary: aDictionary with: aCollectionOfProperties for: anEntity converter: aConverter
	aCollectionOfProperties
		inject: aDictionary
		into: [ :style :aPropertyAndValuable | 
			[ style at: aPropertyAndValuable key put: ((self obtainValue: aPropertyAndValuable value forEntity: anEntity) perform: aConverter) ]
				on: KeyNotFound
				do: [  ].
			style ]