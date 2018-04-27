"
A TLRoassalCompositeLabelShape is a RTShape that display a text inside itself following the provided labelPosition.

Instance Variables
	labelPosition:		<Object>
	labelShape:		<Object>
	padding:		<Object>
	shape:		<Object>

labelPosition
	- xxxxx

labelShape
	- xxxxx

padding
	- xxxxx

shape
	- xxxxx

"
Class {
	#name : #TLRoassalCompositeLabelShape,
	#superclass : #RTShape,
	#instVars : [
		'labelPosition',
		'padding',
		'shape',
		'labelShape'
	],
	#category : 'Telescope-Roassal2'
}

{ #category : #public }
TLRoassalCompositeLabelShape class >> availablePlacing [
	^ self methods select: [ :m | m protocol =#placing ] thenCollect: #selector
]

{ #category : #'as yet unclassified' }
TLRoassalCompositeLabelShape class >> labelPosition: aSymbol [
	"aSymbol has to be #top #bottom #left #right #center #insideCentered"
	^ self new labelPosition: aSymbol
]

{ #category : #'as yet unclassified' }
TLRoassalCompositeLabelShape class >> shape: aShape label: aLabel [
	^ self new
		shape: aShape;
		labelShape:
				(RTLabel new
						text: aLabel;
						yourself);
		yourself
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> borderColor [
	^ self shape borderColor
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> borderColor: aBorderColor [
	^ self shape borderColor: aBorderColor 
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> borderWidth [
	^ self shape borderWidth
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> borderWidth: aBorderWidth [
	^ self shape borderWidth: aBorderWidth
]

{ #category : #placing }
TLRoassalCompositeLabelShape >> bottom [
	^ [ :label : shape | TRConstraint stick: label below: shape ]
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> color [
	^ self shape color
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> color: aColor [
	self shape color: aColor
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> defaultPlacement [
	^ #inside
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> height [
	^ self shape height
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> height: aHeight [
	^ self shape height: aHeight
]

{ #category : #placing }
TLRoassalCompositeLabelShape >> inside [
	^ [ :label :aShape | | max |
			max := (label encompassingRectangle extent + (self padding*2)) max: (aShape encompassingRectangle extent).
			label extent: max.
			aShape extent: max.
			TRConstraint stick: label onTheTopLeftOf: aShape withPadding: self padding ]
]

{ #category : #placing }
TLRoassalCompositeLabelShape >> insideCentered [
	^ [ :label :rtShape | TRConstraint stick: label onTheCenterOf: rtShape ]
]

{ #category : #testing }
TLRoassalCompositeLabelShape >> isComposite [
	^ true
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> labelPosition [
	^ labelPosition ifNil: [ self defaultPlacement ]
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> labelPosition: anObject [
	labelPosition := anObject
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> labelShape [
	^ labelShape
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> labelShape: anObject [
	labelShape := anObject
]

{ #category : #placing }
TLRoassalCompositeLabelShape >> left [
	^ [ :label : shape | TRConstraint stick: label onTheLeftOf: shape ]
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> padding [
	^ padding ifNil: [ padding := 10. padding ]
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> padding: anObject [
	padding := anObject
]

{ #category : #placing }
TLRoassalCompositeLabelShape >> right [
	^ [ :label : shape | TRConstraint stick: label onTheRightOf: shape ]
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> shape [
	^ shape
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> shape: anObject [
	shape := anObject
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> textColor: aColor [
	self labelShape color: aColor
]

{ #category : #placing }
TLRoassalCompositeLabelShape >> top [
	^ [ :label : shape | TRConstraint stick: label above: shape ]
]

{ #category : #public }
TLRoassalCompositeLabelShape >> trachelShapeFor: anElement [
	| s1 s2 c |
	s1 := self labelShape trachelShapeFor: anElement.
	s2 := self shape trachelShapeFor: anElement.
	(self labelPosition value: self) value: s1 value: s2.
	c := TRCompositeShape new addShape: s1 ; addShape: s2 ; yourself.
	^ c
]

{ #category : #hooks }
TLRoassalCompositeLabelShape >> update [
	self shape update.
	self labelShape update
]

{ #category : #hooks }
TLRoassalCompositeLabelShape >> updateFor: anElement [
	self updateLabelFor: anElement.
	self updateShapeFor: anElement
]

{ #category : #updating }
TLRoassalCompositeLabelShape >> updateLabelFor: anElement [
	| labelShapeTrachel |
	labelShapeTrachel := anElement trachelShape shapes first.
	self labelShape updateFor: anElement trachelShape: labelShapeTrachel.
	labelShapeTrachel pushFront
]

{ #category : #updating }
TLRoassalCompositeLabelShape >> updateShapeFor: anElement [
	|  trachelShape |
	trachelShape := anElement trachelShape shapes second.
	trachelShape isNil
		ifTrue: [ ^ self ].
	trachelShape color: (self shape colorFor: anElement).
	trachelShape strokePaint: (self shape borderColorFor: anElement).
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> width [
	^ self shape width
]

{ #category : #accessing }
TLRoassalCompositeLabelShape >> width: aWidth [
	aWidth = TLLabelBasedWidth ifFalse: [ self shape width: aWidth]
]
