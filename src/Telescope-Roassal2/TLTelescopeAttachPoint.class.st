Class {
	#name : #TLTelescopeAttachPoint,
	#superclass : #RTAttachPoint,
	#category : 'Telescope-Roassal2'
}

{ #category : #'public - hooks' }
TLTelescopeAttachPoint >> endingPointOf: anEdge [
	| shapeFrom shapeTo segment |
	shapeFrom := anEdge from shape isComposite
		ifTrue: [ anEdge from trachelShape shapes second ]
		ifFalse: [ anEdge from trachelShape ].
	shapeTo := anEdge to shape isComposite
		ifTrue: [ anEdge to trachelShape shapes second ]
		ifFalse: [ anEdge to trachelShape ].
	^ shapeTo class = TRBoxShape
		ifFalse: [ shapeTo encompassingRectangle leftCenter ]
		ifTrue: [ 
			segment := GSegment with: shapeFrom center with: shapeTo center.
			(shapeTo encompassingRectangle edges collect: [ :e | e intersectionPointWithSegment: segment ])
				detect: #notNil
				ifNone: [ shapeTo encompassingRectangle leftCenter ] ]
]

{ #category : #'public - hooks' }
TLTelescopeAttachPoint >> startingPointOf: anEdge [
	| shapeFrom shapeTo segment |
	shapeFrom := anEdge from shape isComposite
		ifTrue: [ anEdge from trachelShape shapes second ]
		ifFalse: [ anEdge from trachelShape ].
	shapeTo := anEdge to shape isComposite
		ifTrue: [ anEdge to trachelShape shapes second ]
		ifFalse: [ anEdge to trachelShape ].
	^ shapeFrom class = TRBoxShape
		ifFalse: [ shapeFrom encompassingRectangle rightCenter ]
		ifTrue: [ 
			segment := GSegment with: shapeFrom center with: shapeTo center.
			(shapeFrom encompassingRectangle edges collect: [ :e | e intersectionPointWithSegment: segment ])
				detect: #notNil
				ifNone: [ shapeFrom encompassingRectangle rightCenter ] ]
]
