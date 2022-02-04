"
I am a legend for Telescope. I am composed of entries that i will display one after the other
"
Class {
	#name : #TLLegend,
	#superclass : #TLDrawable,
	#instVars : [
		'legendEntries'
	],
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #'instance creation' }
TLLegend class >> parent: aTLVisualization [
	^ self new
		parent: aTLVisualization;
		yourself
]

{ #category : #adding }
TLLegend >> addLegendEntry: aLegendEntry [
	self legendEntries addLast: aLegendEntry
]

{ #category : #sugar }
TLLegend >> backGroundDescription: descriptionBlock [
	self deprecated: 'Use #backgroundDescription: instead.'.
	self backGroundDescription: descriptionBlock forNodes: [ self visualization nodes ]
]

{ #category : #'entry-creation' }
TLLegend >> backGroundDescription: descriptionBlock forNodes: nodesBlock [
	self deprecated: 'Use #backgroundDescription:forNodes: instead.'.
	self addLegendEntry: (TLNodeBackgroundLegendEntry description: descriptionBlock context: nodesBlock)
]

{ #category : #'entry-creation' }
TLLegend >> backgroundDescription: descriptionBlock [
	self backgroundDescription: descriptionBlock forNodes: [ self visualization nodes ]
]

{ #category : #'entry-creation' }
TLLegend >> backgroundDescription: descriptionBlock forNodes: nodesBlock [
	self addLegendEntry: (TLNodeBackgroundLegendEntry description: descriptionBlock context: nodesBlock)
]

{ #category : #sugar }
TLLegend >> borderColorDescription: descriptionBlock [
	self borderColorDescription: descriptionBlock forNodes: [ self visualization nodes ]
]

{ #category : #'entry-creation' }
TLLegend >> borderColorDescription: descriptionBlock forNodes: nodesBlock [
	self addLegendEntry: (TLNodeBorderColorLegendEntry description: descriptionBlock context: nodesBlock)
]

{ #category : #style }
TLLegend >> defaultStyle [
	^ #legend
]

{ #category : #'entry-creation' }
TLLegend >> description: aDescription forBorderColor: aColor [
	self addLegendEntry: (TLBorderColorLegendEntry description: aDescription color: aColor)
]

{ #category : #'entry-creation' }
TLLegend >> description: aDescription forBorderShape: aShape [
	self addLegendEntry: (TLBorderShapeLegendEntry description: aDescription shape: aShape)
]

{ #category : #'entry-creation' }
TLLegend >> description: aDescription forColor: aColor [
	self addLegendEntry: (TLColorLegendEntry description: aDescription color: aColor)
]

{ #category : #'entry-creation' }
TLLegend >> description: descriptionBlock  forConnectionStyle: aTLStyleSheet [
	self addLegendEntry: (TLStyleSheetLegendEntry description: descriptionBlock styleSheet: aTLStyleSheet)
]

{ #category : #'entry-creation' }
TLLegend >> description: descriptionBlock  forConnectionStyle: aTLStyleSheet icon: aString [
	self addLegendEntry: (TLStyleSheetLegendEntry description: descriptionBlock styleSheet: aTLStyleSheet icon: aString)
]

{ #category : #'entry-creation' }
TLLegend >> description: aDescription forGradient: aGradient [
	self addLegendEntry: (TLGradientLegendEntry description: aDescription gradient: aGradient)
]

{ #category : #'entry-creation' }
TLLegend >> descriptionForHeight: aDescription [
	self addLegendEntry: (TLHeightLegendEntry description: aDescription)
]

{ #category : #'entry-creation' }
TLLegend >> descriptionForWidth: aDescription [
	self addLegendEntry: (TLWidthLegendEntry description: aDescription)
]

{ #category : #generation }
TLLegend >> generateWith: aTLCytoscapeConnector [ 
	^ aTLCytoscapeConnector generateLegend: self
]

{ #category : #initialization }
TLLegend >> initialize [
	super initialize.
	self legendEntries: TLDrawableCollection new
]

{ #category : #accessing }
TLLegend >> legendEntries [
	^ legendEntries
]

{ #category : #accessing }
TLLegend >> legendEntries: anObject [
	legendEntries := anObject
]

{ #category : #'entry-creation' }
TLLegend >> nodeShapeDescription: descriptionBlock forNodes: nodesBlock [
	self addLegendEntry: (TLNodeShapeLegendEntry description: descriptionBlock context: nodesBlock)
]

{ #category : #accessing }
TLLegend >> parent: aTLVisualization [
	self assert: aTLVisualization isVisualization description: 'A legend can only have a visualization as parent'.
	parent := aTLVisualization
]

{ #category : #generation }
TLLegend >> removeWith: aTLConnector [
	aTLConnector removeLegend: self
]

{ #category : #state }
TLLegend >> requireUpdate [
	self isUpdateRequired: true.
]

{ #category : #generation }
TLLegend >> updateWith: aConnector [
	aConnector updateLegend: self
]
