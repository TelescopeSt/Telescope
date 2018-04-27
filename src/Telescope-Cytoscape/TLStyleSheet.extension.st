Extension { #name : #TLStyleSheet }

{ #category : #'*Telescope-Cytoscape' }
TLStyleSheet >> adaptStyleForComposite: aDictionaryStyle [
	aDictionaryStyle
		removeKey: #height ifAbsent: [  ];
		removeKey: #width ifAbsent: [  ].
	
]

{ #category : #'*Telescope-Cytoscape' }
TLStyleSheet >> backgroundImageOpacity [
	^ self get: #backgroundImageOpacity
]

{ #category : #'*Telescope-Cytoscape' }
TLStyleSheet >> backgroundImageOpacity: aFloat [
	self at: #backgroundImageOpacity put: aFloat
]

{ #category : #'*Telescope-Cytoscape' }
TLStyleSheet >> backgroundImageUrl [
	^ self get: #backgroundImageUrl
]

{ #category : #'*Telescope-Cytoscape' }
TLStyleSheet >> backgroundImageUrl: anUrl [
	self at: #backgroundImageUrl put: anUrl asUrl
]

{ #category : #'*Telescope-Cytoscape' }
TLStyleSheet >> cytoscapeConnectionStyleFor: aConnection [
	| styleDictionary |
	styleDictionary := Dictionary new.
	self
		fillStyleDictionary: styleDictionary
		with:
			{(#width -> #width).
			(#'line-color' -> #color).
			(#'line-style' -> #connectionStyle).
			(#label -> #connectionLabel).
			(#'curve-style' -> #curveStyle).
			(#'line-style' -> #connectionLineStyle).
			(#'font-size' -> #connectionLabelSize)}
		for: aConnection
		converter: #forCytoscapeConnection.
	{(#base -> #'source-arrow-').
	(#middleReversed -> #'mid-source-arrow-').
	(#head -> #'target-arrow-').
	(#middle -> #'mid-target-arrow-')}
		do: [ :substyleAndCytoStyle | 
			(self copyWithout: #(#shape)) + (self > substyleAndCytoStyle key)
				fillStyleDictionary: styleDictionary
				with:
					{((substyleAndCytoStyle value , #color) -> #color).
					((substyleAndCytoStyle value , #shape) -> #shape)}
				for: aConnection
				converter: #forCytoscapeConnection ].
	^ styleDictionary
]

{ #category : #'*Telescope-Cytoscape' }
TLStyleSheet >> cytoscapeNodeStyleFor: aNode [
	| nodeLabelPosition styleDictionary shape |
	nodeLabelPosition := TLPosition for: (self obtainValue: #nodeLabelPosition forEntity: aNode entity inNode: aNode).
	styleDictionary := Dictionary new.
	self
		fillStyleDictionary: styleDictionary
		with:
			{(#'border-color' -> #borderColor).
			(#'border-opacity' -> [ :t | [ :e :n | (t obtainValue: #borderColor forEntity: e inNode: n) alpha ] ]).
			(#'border-width' -> #borderWidth).
			(#'border-style' -> #borderStyle).
			(#width -> #width).
			(#height -> #height).
			(#'background-color' -> #backgroundColor).
			(#'background-image' -> #backgroundImageUrl).
			(#'background-image-opacity' -> #backgroundImageOpacity).
			(#'background-opacity' -> [ :t | [ :e :n | (t obtainValue: #backgroundColor forEntity: e inNode: n) alpha ] ]).
			(#label -> #nodeLabel).
			(#color -> #textColor).
			(#'font-size' -> #labelSize).
			(#'text-wrap' -> #nodeLabelWrap).
			(#'text-max-width' -> #nodeLabelMaxWidth)}
		for: aNode
		converter: #forCytoscapeNode.
	styleDictionary
		at: 'text-halign' put: nodeLabelPosition horizontal;
		at: 'text-valign' put: nodeLabelPosition vertical.
	shape := self obtainValue: #shape forEntity: aNode entity inNode: aNode.
	styleDictionary at: shape cytoscapeAttribute put: shape forCytoscapeNode.
	shape cytoscapeAttribute = #shape
		ifFalse: [ styleDictionary at: #shape put: #polygon ].
	(aNode isComposite and: [ aNode hasChildrenToDisplay ])
		ifTrue: [ self adaptStyleForComposite: styleDictionary ].
	"If we do not give an empty label to cytoscape when there is no label, it zill not remove a potential current label."
	styleDictionary at: 'label' ifAbsentPut: [ '' ].
	^ styleDictionary
]

{ #category : #'*Telescope-Cytoscape' }
TLStyleSheet >> cytoscapeTriggerStyleFor: aTrigger [
	| nodeLabelPosition styleDictionary |
	nodeLabelPosition := self obtainValue: #nodeLabelPosition forEntity: nil inNode: aTrigger.
	styleDictionary := Dictionary new.
	self
		fillStyleDictionary: styleDictionary
		with:
			{('border-color' -> #borderColor).
			('border-width' -> #borderWidth).
			(#width -> #width).
			(#height -> #height).
			('background-color' -> #backgroundColor).
			(#label -> #nodeLabel).
			(#shape -> #shape)}
		for: aTrigger
		converter: #forCytoscapeNode.
	styleDictionary
		at: 'text-halign' put: nodeLabelPosition horizontal;
		at: 'text-valign' put: nodeLabelPosition vertical.
	^ styleDictionary
]

{ #category : #'*Telescope-Cytoscape' }
TLStyleSheet >> fillStyleDictionary: aDictionary with: aCollectionOfProperties for: aDrawable converter: aConverter [
	aCollectionOfProperties
		inject: aDictionary
		into: [ :style :aPropertyAndValuable | 
			[ 
			style
				at: aPropertyAndValuable key
				put: ((self obtainValue: aPropertyAndValuable value forEntity: aDrawable entity inNode: aDrawable) perform: aConverter) ]
				on: TLStyleSheetMissingProperty
				do: [  ].
			style ]
]
