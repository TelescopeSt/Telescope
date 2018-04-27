Class {
	#name : #TLNest,
	#superclass : #RTNest,
	#category : 'Telescope-Roassal2'
}

{ #category : #'as yet unclassified' }
TLNest >> centerOn: backElement elements: elements [
	"Public method. This method does the following actions:
		- resize the backElement to encompasse all the elements
		- translate all the elements on top of backElement
		- perform a layout if one is set"

	| encompassingRectangle off |
	self doLayoutIfNecessaryOn: elements.
	encompassingRectangle := self encompassingRectangleOf: elements.
	off := backElement shape isComposite
		ifTrue: [ self resizeComposite: backElement with: encompassingRectangle ]
		ifFalse: [ self resizeSimple: backElement with: encompassingRectangle ].
	off := off asIntegerPoint.
	elements do: [ :e | e translateBy: off ]	"This is a big big question whether we need this or not"	"backElement attributes at: #nestedElements put: elements."
]

{ #category : #'as yet unclassified' }
TLNest >> initialize [
	super initialize.
	self padding: 10
]

{ #category : #'as yet unclassified' }
TLNest >> makeElements: elements draggableBy: backElement [
	| callback |
	callback := TRTranslationCallback block: [ :shape :step | elements do: [ :e | e translateBy: step ] ].
	backElement shape isComposite
		ifTrue: [ backElement trachelShape shapes second addCallback: callback ]
		ifFalse: [ backElement trachelShape addCallback: callback  ]
]

{ #category : #private }
TLNest >> resizeComposite: backElement with: encompassingRectangle [
	| composite shape label extent |
	composite := backElement shape.
	shape := backElement trachelShape shapes second.
	label := backElement trachelShape shapes first.
	composite labelPosition = #inside
		ifTrue: [ 
			extent :=
				((encompassingRectangle width max: (label width + composite padding)) + (padding * 2))
				@ (encompassingRectangle height + (label height + composite padding) + (padding * 2)).
			shape extent: extent.
			
			^ ((shape encompassingRectangle center x - encompassingRectangle center x)
				@ (shape encompassingRectangle topLeft y + (composite padding + label height + padding))) ]
		ifFalse: [ 
			extent := 
				(encompassingRectangle width + (padding * 2)) 
				@ (encompassingRectangle height + (padding * 2)).
			(extent = (5@5)) ifTrue: [ extent := 15@15 ].
			shape extent: extent.
			^ shape encompassingRectangle center - encompassingRectangle center ]
]

{ #category : #private }
TLNest >> resizeSimple: backElement with: encompassingRectangle [
	| shape extent |
	extent := (encompassingRectangle width + (padding * 2)) @ (encompassingRectangle height + (padding * 2)).
	shape := backElement trachelShape.
	shape extent: extent.
	^ shape encompassingRectangle center - encompassingRectangle center
]
