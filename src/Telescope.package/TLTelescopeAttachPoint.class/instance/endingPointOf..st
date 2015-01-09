public - hooks
endingPointOf: anEdge
	| element shape |
	element := anEdge to.
	shape := element shape isComposite
		ifTrue: [ element trachelShape shape2 ]
		ifFalse: [ element trachelShape ].
	^ shape encompassingRectangle leftCenter
	"^ anEdge to position asIntegerPoint"