"
I am a class that will contain the roassal2 logic to place shape
"
Class {
	#name : #TLRoassal2ShapePlacer,
	#superclass : #TLObject,
	#category : 'Telescope-Roassal2'
}

{ #category : #placing }
TLRoassal2ShapePlacer class >> bottom [
	^ [ :label : shape | TRConstraint stick: label below: shape ]
]

{ #category : #placing }
TLRoassal2ShapePlacer class >> inside [
	^ [ :label :aShape | | max |
			max := (label encompassingRectangle extent + (self padding*2)) max: (aShape encompassingRectangle extent).
			label extent: max.
			aShape extent: max.
			TRConstraint stick: label onTheTopLeftOf: aShape withPadding: self padding ]
]

{ #category : #placing }
TLRoassal2ShapePlacer class >> insideCentered [
	^ [ :label :rtShape | TRConstraint stick: label onTheCenterOf: rtShape ]
]

{ #category : #placing }
TLRoassal2ShapePlacer class >> left [
	^ [ :label : shape | TRConstraint stick: label onTheLeftOf: shape ]
]

{ #category : #place }
TLRoassal2ShapePlacer class >> place: s1 relativeTo: s2 following: aTLPosition [ 
	(aTLPosition forRoassal2 value: self) value: s1 value: s2.
]

{ #category : #placing }
TLRoassal2ShapePlacer class >> right [
	^ [ :label : shape | TRConstraint stick: label onTheRightOf: shape ]
]

{ #category : #placing }
TLRoassal2ShapePlacer class >> top [
	^ [ :label : shape | TRConstraint stick: label above: shape ]
]
