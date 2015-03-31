public - hooks
startingPointOf: anEdge
	| shapeFrom shapeTo segment |
	shapeFrom := anEdge from shape isComposite
		ifTrue: [ anEdge from trachelShape shape2 ]
		ifFalse: [ anEdge from trachelShape ].
	shapeTo := anEdge to shape isComposite
		ifTrue: [ anEdge to trachelShape shape2 ]
		ifFalse: [ anEdge to trachelShape ].
	^ shapeFrom class = TRBoxShape
		ifFalse: [ shapeFrom encompassingRectangle rightCenter ]
		ifTrue: [ 
			segment := GSegment with: shapeFrom center with: shapeTo center.
			(shapeFrom encompassingRectangle edges collect: [ :e | e intersectionPointWithSegment: segment ])
				detect: #notNil
				ifNone: [ shapeFrom encompassingRectangle rightCenter ] ]