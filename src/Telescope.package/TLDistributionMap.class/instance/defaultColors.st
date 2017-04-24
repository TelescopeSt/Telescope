default
defaultColors
	^ MDLColor colors keys
		inject: OrderedCollection new
		into: [ :coll :color | 
			coll
				add: (MDLColor tint: color code: #'200');
				add: (MDLColor tint: color code: #'800');
				yourself ]