*Telescope-Cytoscape
fillStyleDictionary: aDictionary with: aCollectionOfProperties for: aDrawable converter: aConverter
	aCollectionOfProperties
		inject: aDictionary
		into: [ :style :aPropertyAndValuable | 
			[ 
			style
				at: aPropertyAndValuable key
				put: ((self obtainValue: aPropertyAndValuable value forEntity: aDrawable entity inNode: aDrawable) perform: aConverter) ]
				on: TLStyleSheetMissingProperty
				do: [  ].
			style ]