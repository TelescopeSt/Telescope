as yet unclassified
centerOn: backElement elements: elements
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