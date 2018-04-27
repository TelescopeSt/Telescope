"
A TLGenerator is the superclass for every generator that will create roassal elements from telescope entities.

Instance Variables
	edges:		<Object>
	elements:		<Object>
	view:		<Object>

edges
	- xxxxx

elements
	- xxxxx

view
	- xxxxx

"
Class {
	#name : #TLRoassal2Connector,
	#superclass : #TLViewConnector,
	#instVars : [
		'viewMorph',
		'nestByParent'
	],
	#category : 'Telescope-Roassal2'
}

{ #category : #'as yet unclassified' }
TLRoassal2Connector class >> priority [
	^ 5
]

{ #category : #'visu-window-menu' }
TLRoassal2Connector class >> visualizationWindowMenuOn: aBuilder [
	<telescopeMenu>
	(aBuilder item: #'Export to PNG')
		action: [ :connector | 
					| fileName |
					fileName := UITheme builder fileSave: 'Enter the PNG file name' extensions: #('png') path: nil.
					fileName notNil
						ifTrue: [ 
							RTPNGExporter new
								builder: connector;
								fileName: fileName fullName;
								exportToFile ] ];
		icon: Smalltalk ui icons configurationIcon
]

{ #category : #view }
TLRoassal2Connector >> addElementConnectionInView: element [
	self view add: element
]

{ #category : #view }
TLRoassal2Connector >> addElementInteractionInView: element [
	self view add: element
]

{ #category : #view }
TLRoassal2Connector >> addElementLegendInView: legend [
	self view addAll: legend
]

{ #category : #view }
TLRoassal2Connector >> addElementLegendItemInView: legendItem [
	self view addAll: legendItem
]

{ #category : #view }
TLRoassal2Connector >> addElementNodeInView: element [
	self view add: element
]

{ #category : #layout }
TLRoassal2Connector >> applyLayoutOf: aTLGroup on: group [
	aTLGroup layout on: group
]

{ #category : #'instance creation' }
TLRoassal2Connector >> closeVisualization [
	self viewMorph delete
]

{ #category : #private }
TLRoassal2Connector >> configView [
	| v |
	self flag: 'should not define draggable and zoomable but still here because not a good idea to define twice it if view is still draggable or zoomable'.
	v := RTView new.
	v @ RTDraggableView.
	v @ RTZoomableView.
	^ v
]

{ #category : #'generation - connection' }
TLRoassal2Connector >> createElementConnection: aTLConnection From: fromNode to: toNode [
	| edge fromElement toElement effectiveStylesheet |
	self flag: 'the shape logic of edge is not good'.
	effectiveStylesheet := aTLConnection effectiveStyleSheet.
	fromElement := self elementFromTLDrawable: fromNode.
	toElement := self elementFromTLDrawable: toNode.
	edge := (self obtainEdgeShapeFromStylesheet: effectiveStylesheet) edgeFrom: fromElement to: toElement.
	self customizeEdgeShape: edge withStyleSheet: effectiveStylesheet.
			
	"edge trachelShape pushBack."
	^ edge
]

{ #category : #'generation - interaction' }
TLRoassal2Connector >> createElementFromTrigger: aTLShapeTrigger [
	| shape styleSheet |
	styleSheet := aTLShapeTrigger effectiveStyleSheet.
	shape := self generateShapeCorrespondingTo: aTLShapeTrigger shape.
	[ shape := self makeCompositeShape: shape withLabel: styleSheet nodeLabel ]
		on: KeyNotFound
		do: [ 
			"no need to create a composite shape"
			 ].
	self customizeShape: shape withStyleSheet: styleSheet.
	^ shape elementOn: nil
]

{ #category : #'generation - legend' }
TLRoassal2Connector >> createElementLegendItemFrom: aTLLegendItem [
	| shape title group |
	shape := self generateShapeCorrespondingTo: (aTLLegendItem shape).
	self customizeShape: shape withStyleSheet: aTLLegendItem effectiveStyleSheet.
	title := RTLabel new text: (aTLLegendItem title).
	group := RTGroup with: (title element) with: (shape element).
	RTHorizontalLineLayout new gapSize: 3; alignCenter; on: group.
	group do: [ :element | element setAsFixed ].
	^ group
]

{ #category : #'generation - node' }
TLRoassal2Connector >> createElementNodeFromNode: aNode [
	| element shape styleSheet |
	
	styleSheet := aNode effectiveStyleSheet.
	
	shape := self generateShapeCorrespondingTo: aNode shape.
	
	[shape := self makeCompositeShape: shape withLabel: (styleSheet nodeLabel rtValue: aNode entity)] on: KeyNotFound do: ["no need to create a composite shape"].		
	
	self customizeShape: shape withStyleSheet: styleSheet .
	element := shape elementOn: aNode entity.
	^ element
]

{ #category : #'generation - group' }
TLRoassal2Connector >> createGroup: aTLGroup with: aCollection [
	| group |
	group := RTGroup newFrom: aCollection.
	^ group
]

{ #category : #'generation - legend' }
TLRoassal2Connector >> createLegendFrom: legendItems [
	| background legend |
	legendItems ifEmpty: [ ^#() ].
	background := RTBox new color: Color white; borderColor: Color black; element.
	legend := RTGroup newFrom: legendItems.
	RTNest new layout: (RTVerticalLineLayout new alignRight);
		on: background nest: legend.
	background setAsFixed.
	background translateTo: ((background width/2 + 5)@(background height/2 + 5)).
	^ (RTGroup with: background with: legend)
]

{ #category : #'generation - connection' }
TLRoassal2Connector >> customizeEdgeShape: aRTEdge withStyleSheet: aTLStyleSheet [
	"Hack because roassal composite shapes only change color of first shape"
	[ aRTEdge trachelShape shapes do: [ :s | s color: aTLStyleSheet backgroundColor ] ]
		on: MessageNotUnderstood
		do: [ aRTEdge color: aTLStyleSheet backgroundColor ]
]

{ #category : #'generation - node' }
TLRoassal2Connector >> customizeShape: aShape withStyleSheet: aStyleSheet [
	self flag: 'Should not be done like that.'.
	(aShape isKindOf: RTLabel)
		ifFalse: [ 
			aShape
				borderColor: aStyleSheet borderColor;
				borderWidth: aStyleSheet borderWidth;
				width: aStyleSheet width;
				color: aStyleSheet backgroundColor.
			aShape isComposite
				ifTrue: [ 
					aShape labelPosition: aStyleSheet nodeLabelPosition forRoassal2.
					aShape textColor: aStyleSheet textColor.
					aShape labelShape text: aStyleSheet nodeLabel 
					] ]
		ifTrue: [ 
			aShape color: aStyleSheet textColor.
			aShape text: aStyleSheet nodeLabel.
			self flag: 'this way i have to always set the color' ].
	aShape height: aStyleSheet height
]

{ #category : #'generation - node' }
TLRoassal2Connector >> define: aRTElement asParentFor: aTLRoassal2Connector [ 
	"Nothing to do here because nesting has been done before when Telescope entities where available for knowing layout to apply on children"
]

{ #category : #'generation - interaction' }
TLRoassal2Connector >> generateBasicInteraction: aTLInteraction onNode: aTLNode [
	| element |
	element := self elementFromTLDrawable: aTLNode.
	element @ aTLInteraction interaction
]

{ #category : #'generation - node' }
TLRoassal2Connector >> generateChildrenOf: aCompositeNode [
	| children |
	children := super generateChildrenOf: aCompositeNode.
	self onNode: aCompositeNode nestNodes: aCompositeNode childrenGroup.
	^ children
]

{ #category : #'generation - interaction' }
TLRoassal2Connector >> generateClickInteraction: aClickInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseLeftClick do: [ :evt | self executeInteraction: aClickInteraction forDrawable: aTargetDrawable ]
]

{ #category : #'generation - node' }
TLRoassal2Connector >> generateCompositeNode: aCompositeNode [
	| parent |
	parent := self generateSimpleNode: aCompositeNode.
	(aCompositeNode expanded and: [ aCompositeNode hasChildren ]) ifTrue: [ self generateChildrenOf: aCompositeNode ].
	^ parent
]

{ #category : #'generation - interaction' }
TLRoassal2Connector >> generateDoubleClickInteraction: aDoubleClickInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseDoubleLeftClick do: [ :evt | self executeInteraction: aDoubleClickInteraction forDrawable: aTargetDrawable]
]

{ #category : #'generation - interaction' }
TLRoassal2Connector >> generateMouseOverInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [ 
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseEnter do: [ :evt | self executeInteraction: aTLMouseOverInteraction forDrawable: aTargetDrawable].
	element when: TRMouseLeave do: [ :evt | self executeInteraction: aTLMouseOverInteraction forDrawable: aTargetDrawable].
	
]

{ #category : #'generation - interaction' }
TLRoassal2Connector >> generatePopupInteraction: aTLPopupInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element @ (RTPopup text: [ :assoc | aTLPopupInteraction text: aTargetDrawable ])
]

{ #category : #'generation - shape' }
TLRoassal2Connector >> generateShapeCorrespondingTo: aTLSimpleShape [
	^ ({TLEllipse -> RTEllipse . TLRectangle -> RTBox . TLNoShape -> RTLabel } asDictionary at: aTLSimpleShape) new
]

{ #category : #'generation - interaction' }
TLRoassal2Connector >> generateShiftClickInteraction: aClickInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseLeftClick do: [ :evt | (Sensor shiftPressed) ifTrue: [self executeInteraction: aClickInteraction forDrawable: aTargetDrawable] ]
]

{ #category : #'generation - interaction' }
TLRoassal2Connector >> generateShiftMouseOverInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [ 
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseEnter do: [ :evt | (Sensor shiftPressed) ifTrue: [self executeInteraction: aTLMouseOverInteraction forDrawable: aTargetDrawable]].
	element when: TRMouseLeave do: [ :evt | (Sensor shiftPressed) ifTrue: [self executeInteraction: aTLMouseOverInteraction forDrawable: aTargetDrawable]].
	
]

{ #category : #'generation - node' }
TLRoassal2Connector >> generateSimpleNode: aSimpleNode [
	^ (super generateSimpleNode: aSimpleNode)
		update;
		yourself
]

{ #category : #initialization }
TLRoassal2Connector >> initialize [
	super initialize.
	self nestByParent: Dictionary new.
	
]

{ #category : #'generation - node' }
TLRoassal2Connector >> makeCompositeShape: aShape withLabel: aLabel [
	^ ((aShape isKindOf: RTLabel) or: [ aLabel = TLNoNodeLabel ])
		ifTrue: [ aShape ]
		ifFalse: [ TLRoassalCompositeLabelShape shape: aShape label: aLabel ]
]

{ #category : #accessing }
TLRoassal2Connector >> nestByParent [
	^ nestByParent
]

{ #category : #accessing }
TLRoassal2Connector >> nestByParent: anObject [
	nestByParent := anObject
]

{ #category : #'generation - connection' }
TLRoassal2Connector >> obtainEdgeShapeFromStylesheet: aStylesheet [
	self flag: 'here we should manage all roassal shit about lines'.
	^ ((aStylesheet > #head) shape = TLTriangle
		ifTrue: [ RTArrowedLine ] ifFalse: [RTLine]) new
		attachPoint: TLTelescopeAttachPoint new;
		color: aStylesheet color;
		yourself
]

{ #category : #nesting }
TLRoassal2Connector >> on: backElement nest: innerElements layout: layout [
	| nest |
	nest := self nestByParent at: backElement ifAbsentPut: (TLNest new).
	innerElements ifEmpty: [ nest padding: 2.5 ] ifNotEmpty: [ nest padding: 15 ].
	nest layout: layout.
	nest makeElements: innerElements draggableBy: backElement.
	nest centerOn: backElement elements: innerElements
]

{ #category : #nesting }
TLRoassal2Connector >> onNode: aNode nestNodes: aGroupOfNodes [
	| backElement innerElements |
	backElement := self elementFromTLDrawable: aNode.
	innerElements := aGroupOfNodes collect: [ :node | self elementFromTLDrawable: node ].
	self
		on: backElement
		nest: innerElements
		layout: (aGroupOfNodes ifEmpty: [ RTGridLayout new ] ifNotEmpty: [ aGroupOfNodes layout ])	"Hack because the connector provide an empty array when removing children"
]

{ #category : #'instance creation' }
TLRoassal2Connector >> openViewInWindowSized: aSize titled: aTitle [
	| window |
	window := self view openInWindowSized: aSize titled: aTitle.
	window menuPragmaNamed: 'telescopeMenu' model: self.
	self viewMorph: window
	"self view canvas camera focusOnCenterScaled.
	self view canvas camera focusOnCenter"
]

{ #category : #'generation - interaction' }
TLRoassal2Connector >> placeElement: anElement correspondingToTrigger: aTLShapeTrigger relativeToDrawable: aTLCompositeNode [
	| element |
	element := self elementFromTLDrawable: aTLCompositeNode.
	TLRoassal2ShapePlacer place: anElement trachelShape relativeTo: (element shape isComposite
				ifTrue: [ element trachelShape shapes second ]
				ifFalse: [ element trachelShape ]) following: aTLShapeTrigger effectiveStyleSheet triggerPosition.
]

{ #category : #'generation - group' }
TLRoassal2Connector >> postGenerationFor: aTLVisualization [
aTLVisualization allConnections
		do: [ :aConnection | 
			[ (self elementFromTLDrawable: aConnection) trachelShape pushFront ]
				on: KeyNotFound
				do: [ 
					"the connection is not managed because it does not exist"
					 ] ]
]

{ #category : #'removing - node' }
TLRoassal2Connector >> removeChildrenOf: aCompositeNode [
	super removeChildrenOf: aCompositeNode.
	self onNode: aCompositeNode nestNodes: #().
]

{ #category : #view }
TLRoassal2Connector >> removeElementConnectionFromView: element [
	self view removeEdge: element
]

{ #category : #view }
TLRoassal2Connector >> removeElementFromView: element associatedToDrawable: aTLDrawable [
	self view removeElement: element
]

{ #category : #view }
TLRoassal2Connector >> removeElementLegendItemFromView: element [
	self view removeElement: element
]

{ #category : #view }
TLRoassal2Connector >> removeElementnteractionFromView: element [
	self view removeElement: element
]

{ #category : #'updating - shape' }
TLRoassal2Connector >> update: compositeShape withCompositeLabelShape: aTLCompositeLabelShape [
	self update: compositeShape labelShape withTLShape: aTLCompositeLabelShape label.
	self update: compositeShape shape withTLShape: aTLCompositeLabelShape shape.
]

{ #category : #'updating - shape' }
TLRoassal2Connector >> update: shape withEllipseShape: aTLEllipseShape [
	shape
		color: aTLEllipseShape color;
		borderColor: aTLEllipseShape borderColor;
		borderWidth: aTLEllipseShape borderWidth;
		height: aTLEllipseShape height;
		width: aTLEllipseShape width
]

{ #category : #'updating - shape' }
TLRoassal2Connector >> update: shape withLabelShape: aTLLabelShape [
	shape
		text: aTLLabelShape text;
		color: aTLLabelShape color
]

{ #category : #'updating - shape' }
TLRoassal2Connector >> update: shape withRectangleShape: aTLRectangleShape [
	shape
		color: aTLRectangleShape color;
		borderColor: aTLRectangleShape borderColor;
		borderWidth: aTLRectangleShape borderWidth;
		height: aTLRectangleShape height;
		width: aTLRectangleShape width
]

{ #category : #'updating - node' }
TLRoassal2Connector >> updateChildrenOf: aCompositeNode [
	super updateChildrenOf: aCompositeNode.
	self
		updateNestOnNode: aCompositeNode
		nestNodes: aCompositeNode childrenGroup
]

{ #category : #'updating - connection' }
TLRoassal2Connector >> updateConnection: aConnection [
	super updateConnection: aConnection.
	(self elementFromTLDrawable: aConnection) trachelShape pushFront
]

{ #category : #'updating - connection' }
TLRoassal2Connector >> updateEdgeOf: aConnection [
	| edge shape |
	shape := (self elementFromTLDrawable: aConnection).
	
	edge := self elementFromTLDrawable: aConnection.
	aConnection hasEntity
		ifTrue: [edge model: aConnection entity].
	edge update.
	self customizeEdgeShape: shape withStyleSheet: aConnection effectiveStyleSheet.
]

{ #category : #'updating - node' }
TLRoassal2Connector >> updateElementNodeOf: aDrawable [
	| element |
	element := self elementFromTLDrawable: aDrawable.
	element model: aDrawable entity.
	self flag: 'Shape changing not managed (from rectangle to circle for example)'.
	self customizeShape: element shape withStyleSheet: aDrawable effectiveStyleSheet.
	element update.
	
]

{ #category : #'updating - interaction' }
TLRoassal2Connector >> updateInteractionsOf: aNode [
	| element |
	element := self elementFromTLDrawable: aNode.
	self flag: 'Hack because Roassal do not expose api to remove methods'.
	element announcer subscriptions subscriptionsDo: [ :s | element announcer removeSubscription: s ].
	self menuInteractionByDrawable removeKey: aNode ifAbsent: [  ].
	self removeInteractionsOf: aNode.
	self generateInteractionsOf: aNode targetingDrawable: aNode
]

{ #category : #'updating - legend' }
TLRoassal2Connector >> updateLegend: aTLLegend [
	| legend background |
	aTLLegend isUpdateRequired
		ifTrue: [ 
			[ 
			legend := self shapeByDrawable at: aTLLegend.
			legend ifNotEmpty: [ 
							legend second do: #remove.
			legend remove: legend second.
			background := legend add: (RTGroup newFrom: (aTLLegend items collect: [ :item | item generateWith: self ])).
			RTNest new
				layout: RTVerticalLineLayout new alignRight;
				on: legend first nest: legend second.
			legend translateTo: (background width / 2 + 10) @ (background height / 2 + 10) ]]
				on: KeyNotFound
				do: [ self flag: 'Should not happen' ].
			aTLLegend updateDone ]
]

{ #category : #nesting }
TLRoassal2Connector >> updateNestOn: backElement nest: innerElements layout: layout [
	| nest |
	nest := self nestByParent at: backElement.
	nest layout: layout.
	nest centerOn: backElement elements: innerElements
]

{ #category : #nesting }
TLRoassal2Connector >> updateNestOnNode: aNode nestNodes: aGroupOfNodes [
	| backElement innerElements |
	backElement := self elementFromTLDrawable: aNode.
	innerElements := self elementsFromTLDrawables: aGroupOfNodes.
	self updateNestOn: backElement nest: innerElements layout: aNode childrenLayout
]

{ #category : #view }
TLRoassal2Connector >> updateViewForVisualization: aTLVisualization [
	aTLVisualization shouldReplaceCameraWhenUpdating ifTrue:
	[self view updateAndAdjustCamera] ifFalse: [ self view signalUpdate ]
]

{ #category : #accessing }
TLRoassal2Connector >> viewMorph [
	^ viewMorph
]

{ #category : #accessing }
TLRoassal2Connector >> viewMorph: anObject [
	viewMorph := anObject
]
