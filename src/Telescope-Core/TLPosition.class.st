"
I represent a position relative to an element
"
Class {
	#name : 'TLPosition',
	#superclass : 'TLObject',
	#instVars : [
		'horizontal',
		'vertical'
	],
	#category : 'Telescope-Core-Style',
	#package : 'Telescope-Core',
	#tag : 'Style'
}

{ #category : 'instance creation' }
TLPosition class >> bottom [
	^ self new bottom
]

{ #category : 'instance creation' }
TLPosition class >> for: aLabelOrPosition [
	^ aLabelOrPosition class = self
		ifTrue: [ aLabelOrPosition ]
		ifFalse: [ self new perform: aLabelOrPosition ]
]

{ #category : 'instance creation' }
TLPosition class >> left [
	^ self new left
]

{ #category : 'instance creation' }
TLPosition class >> right [
	^ self new right
]

{ #category : 'instance creation' }
TLPosition class >> top [
	^ self new top
]

{ #category : 'positions' }
TLPosition >> bottom [
	self
		vertical: #bottom
]

{ #category : 'positions' }
TLPosition >> computePositionOf: anElementTrigger relativeTo: anElementNode [
	| rectangle x y |
	rectangle := anElementNode encompassingRectangle.
	x := rectangle perform: self horizontal.
	y := rectangle perform: self vertical.	
		
		"If we have a point, for example if we get the center of the rectangle, we keep only the interesting part."
	x isPoint
		ifTrue: [ x := x x ].
	y isPoint
		ifTrue: [ y := y y ].
	^ x @ y
]

{ #category : 'evaluating' }
TLPosition >> cull: anEntity cull: aNode [
	^ self
]

{ #category : 'accessing' }
TLPosition >> horizontal [
	^ horizontal
]

{ #category : 'accessing' }
TLPosition >> horizontal: horizontalPosition [
	self assert: (#(left center right) includes: horizontalPosition) description: 'Horizontal position must be left, center or right'.
	horizontal := horizontalPosition
]

{ #category : 'initialization' }
TLPosition >> initialize [
	super initialize.
	self horizontal: #center;
		vertical: #center
]

{ #category : 'positions' }
TLPosition >> inside [
	self
		horizontal: #center;
		vertical: #center
]

{ #category : 'positions' }
TLPosition >> insideCentered [
	self inside
]

{ #category : 'positions' }
TLPosition >> left [
	self
		horizontal: #left
]

{ #category : 'private' }
TLPosition >> oppositeOf: aDirection [
	"The direction on the other side: left and right, top and bottom, and the center for the center"

	aDirection = #left ifTrue: [ ^ #right ].
	aDirection = #right ifTrue: [ ^ #left ].
	aDirection = #top ifTrue: [ ^ #bottom ].
	aDirection = #bottom ifTrue: [ ^ #top ].
	^ aDirection
]

{ #category : 'helper' }
TLPosition >> reversed [
	"The position on the other side of the node, on both axes: the bottom right for the top left. The center stays the center"

	^ self class new
		  horizontal: (self oppositeOf: horizontal);
		  vertical: (self oppositeOf: vertical);
		  yourself
]

{ #category : 'positions' }
TLPosition >> right [
	self
		horizontal: #right
]

{ #category : 'positions' }
TLPosition >> top [
	self
		vertical: #top
]

{ #category : 'accessing' }
TLPosition >> vertical [
	^ vertical
]

{ #category : 'accessing' }
TLPosition >> vertical: verticalPosition [
	self assert: (#(top center bottom) includes: verticalPosition) description: 'VerticalPosition position must be top, center or bottom'.
	vertical := verticalPosition
]
