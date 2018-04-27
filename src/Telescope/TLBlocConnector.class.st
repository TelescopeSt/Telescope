"
TLBlocConnector is a connector that will create Bloc elements from a Telescope model
"
Class {
	#name : #TLBlocConnector,
	#superclass : #TLViewConnector,
	#category : 'Telescope-Connector'
}

{ #category : #accessing }
TLBlocConnector class >> priority [
	^ 2
]

{ #category : #view }
TLBlocConnector >> addElementLegendInView: legendItems [ 
	legendItems ifNotNil: [ Halt now ]
]

{ #category : #view }
TLBlocConnector >> addElementNodeInView: aBlRectangleView [ 
	"Nothing to do because the view don't need to know all its element; only those at the upper level"
]

{ #category : #layout }
TLBlocConnector >> applyLayoutOf: aTLGroup on: aCollection [ 
	"do nothing yet"
]

{ #category : #private }
TLBlocConnector >> configView [
	view := BlMorph whiteRectangleSample.
	^ view
]

{ #category : #'generation - node' }
TLBlocConnector >> createElementNodeFromNode: aNode [ 
	
	| styleSheet blocView |
	styleSheet := aNode effectiveStyleSheet.
	
	blocView := self generateShapeCorrespondingTo: styleSheet shape.
	
	self customizeShape: blocView withStyleSheet: styleSheet .
	
	^ blocView
]

{ #category : #'generation - group' }
TLBlocConnector >> createGroup: aTLGroup with: aCollection [
	^ aCollection copy
]

{ #category : #'generation - node' }
TLBlocConnector >> customizeShape: aBlView withStyleSheet: aTLStyleSheet [ 
	aBlView color: aTLStyleSheet backgroundColor.
	aBlView borderStyle: (BlSolidRectangleBorder new color: aTLStyleSheet borderColor; width: aTLStyleSheet borderWidth).
]

{ #category : #view }
TLBlocConnector >> displayGroupElement: aCollection [ 
	aCollection do: [:anElement | self view  addView: anElement]
]

{ #category : #'generation - shape' }
TLBlocConnector >> generateShapeCorrespondingTo: aTLSimpleShape [
	^ ({TLEllipse -> BlEllipseView . TLRectangle -> BlRectangleView  } asDictionary at: aTLSimpleShape) new
]
