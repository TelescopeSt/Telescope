placing
translateInPositiveReferencial: result
	| vector |
	vector := result associations
		inject: 0 @ 0
		into: [ :translation :nodeAndPosition | 
			| dimension |
			dimension := self obtainsNodeDimension: nodeAndPosition key.
			translation max: (nodeAndPosition value - (dimension / 2)) negated ].
	result keysAndValuesDo: [ :aNode :aPosition | aNode position: aPosition + vector ]