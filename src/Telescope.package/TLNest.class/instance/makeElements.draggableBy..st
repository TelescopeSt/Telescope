as yet unclassified
makeElements: elements draggableBy: backElement
	| callback |
	callback := TRTranslationCallback block: [ :shape :step | elements do: [ :e | e translateBy: step ] ].
	backElement shape isComposite
		ifTrue: [ backElement trachelShape shapes second addCallback: callback ]
		ifFalse: [ backElement trachelShape addCallback: callback  ]