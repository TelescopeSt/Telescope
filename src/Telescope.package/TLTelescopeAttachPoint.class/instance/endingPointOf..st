public - hooks
endingPointOf: anEdge
	| shapeFrom shapeTo segment |
	shapeFrom := anEdge from shape isComposite
		ifTrue: [ anEdge from trachelShape shape2 ]
		ifFalse: [ anEdge from trachelShape ].
	shapeTo := anEdge to shape isComposite
		ifTrue: [ anEdge to trachelShape shape2 ]
		ifFalse: [ anEdge to trachelShape ].
	^ shapeTo class = TRBoxShape
		ifFalse: [ shapeTo encompassingRectangle leftCenter ]
		ifTrue: [ 
			segment := GSegment with: shapeFrom center with: shapeTo center.
			(shapeTo encompassingRectangle edges collect: [ :e | e intersectionPointWithSegment: segment ])
				detect: #notNil
				ifNone: [ shapeTo encompassingRectangle leftCenter ] ]