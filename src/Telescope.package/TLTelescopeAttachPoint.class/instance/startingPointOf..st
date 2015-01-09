public - hooks
startingPointOf: anEdge
	| element shape |
	element := anEdge from.
	shape := element shape isComposite
		ifTrue: [ element trachelShape shape2 ]
		ifFalse: [ element trachelShape ].
	^ shape encompassingRectangle rightCenter
	"^ anEdge from position asIntegerPoint"