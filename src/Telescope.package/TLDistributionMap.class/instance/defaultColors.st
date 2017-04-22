default
defaultColors
	^ MDLColor colors keys
		inject: OrderedCollection new
		into: [ :coll :color | 
			coll
				add: (MDLColor tint: color code: #'300');
				add: (MDLColor tint: color code: #'700');
				yourself ]