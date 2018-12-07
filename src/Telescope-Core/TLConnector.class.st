"
A TLConnector is the abstract class for a connector able to display a Telescope visualization.

Instance Variables
	menuInteractionByDrawable:		<Object>
	nestByParent:		<Object>
	shapeByDrawable:		<Object>
	shapeByLegendItem:		<Object>
	shapeInteractionByDrawable:		<Object>
	view:		<Object>
	viewMorph:		<Object>

menuInteractionByDrawable
	- xxxxx

nestByParent
	- xxxxx

shapeByDrawable
	- xxxxx

shapeByLegendItem
	- xxxxx

shapeInteractionByDrawable
	- xxxxx

view
	- xxxxx

viewMorph
	- xxxxx

"
Class {
	#name : #TLConnector,
	#superclass : #TLObject,
	#instVars : [
		'shapeByDrawable',
		'menuInteractionByDrawable',
		'interactionsByDrawable',
		'triggerForInteractionAndDrawable'
	],
	#category : #'Telescope-Core-Connector'
}

{ #category : #accessing }
TLConnector class >> default [
	^ self allSubclasses detectMax: #priority
]

{ #category : #accessing }
TLConnector class >> priority [
	^ self subclassResponsibility 
]

{ #category : #view }
TLConnector >> addElementConnectionInView: element [
	self subclassResponsibility
]

{ #category : #view }
TLConnector >> addElementInteractionInView: element [
	self subclassResponsibility
]

{ #category : #view }
TLConnector >> addElementLegendInView: legend [
	self subclassResponsibility 
]

{ #category : #view }
TLConnector >> addElementLegendItemInView: legendItem [
	self subclassResponsibility
]

{ #category : #view }
TLConnector >> addElementNodeInView: element [
	self subclassResponsibility
]

{ #category : #layout }
TLConnector >> applyLayoutOf: aTLGroup on: group [
	self subclassResponsibility
]

{ #category : #initialization }
TLConnector >> closeVisualization [
	self subclassResponsibility
]

{ #category : #'generation - connection' }
TLConnector >> createElementConnection: aTLConnection From: fromNode to: toNode [
	self subclassResponsibility
]

{ #category : #'generation - interaction' }
TLConnector >> createElementFromTrigger: aTLShapeTrigger [
	self subclassResponsibility 
]

{ #category : #'generation - legend' }
TLConnector >> createElementLegendItemFrom: aTLLegendItem [
	self subclassResponsibility 
]

{ #category : #'generation - node' }
TLConnector >> createElementNodeFromNode: aNode [
	self subclassResponsibility
]

{ #category : #'generation - group' }
TLConnector >> createGroup: aTLGroup with: anObject [
	self subclassResponsibility
]

{ #category : #'generation - legend' }
TLConnector >> createLegendFrom: legendItems [
	self subclassResponsibility 
]

{ #category : #'generation - interaction' }
TLConnector >> createMenuFor: aTLDrawable [
	self subclassResponsibility
]

{ #category : #'generation - node' }
TLConnector >> define: parentCompositeElement asParentFor: aCollectionOfChildrenElements [
	self subclassResponsibility
]

{ #category : #view }
TLConnector >> displayGroupElement: aCollection [ 
	"To override when technologie require to display the root nodes of all elements. Otherwise no need to do that because each element is added on creation"
]

{ #category : #accessing }
TLConnector >> elementFromTLDrawable: aNode [
	^ self shapeByDrawable at: aNode
]

{ #category : #accessing }
TLConnector >> elementFromTLDrawable: aNode ifNone: aBlock [
	^ self shapeByDrawable at: aNode ifAbsent: [ aBlock value ]
]

{ #category : #accessing }
TLConnector >> elementFromTLDrawable: aNode ifPresent: aBlock ifNone: anotherBlock [
	^ self shapeByDrawable at: aNode ifPresent: [ :shape | aBlock value: shape ] ifAbsent: [ anotherBlock value ]
]

{ #category : #accessing }
TLConnector >> elementsFromTLDrawables: aGroupOfNodes [
	^ aGroupOfNodes collect: [ :node | self elementFromTLDrawable: node ]
]

{ #category : #'execution-interaction' }
TLConnector >> executeChoice: aChoiceIndex interaction: anInteraction forDrawable: aTLDrawable [
	self
		executeInteraction: anInteraction
		parameter: ((anInteraction choicesListForDrawable: aTLDrawable) at: aChoiceIndex)
		forDrawable: aTLDrawable
]

{ #category : #'execution-interaction' }
TLConnector >> executeInteraction: anInteraction forDrawable: aTLDrawable [
	| visualization |
	visualization := aTLDrawable visualization.
	"we have to memorize the visualization because we are not sure the element will still be part of visualization after action"
	anInteraction actionOn: aTLDrawable. 
	visualization update
]

{ #category : #'execution-interaction' }
TLConnector >> executeInteraction: anInteraction forDrawables: drawables [
	| visualization |
	drawables
		ifNotEmpty: [ 
			visualization := drawables anyOne visualization.	"we have to memorize the visualization because we are not sure the element will still be part of visualization after action"
			drawables do: [ :aTLDrawable | anInteraction actionOn: aTLDrawable ].
			visualization update.
			self flag: 'move this to telescope-cytoscape'.
			visualization requireUpdateAndLayoutApplication.
			visualization update ]
]

{ #category : #'execution-interaction' }
TLConnector >> executeInteraction: anInteraction parameter: aParameter forDrawable: aTLDrawable [
	| visualization |
	visualization := aTLDrawable visualization.	"we have to memorize the visualization because we are not sure the element will still be part of visualization after action"
	anInteraction actionOn: aTLDrawable parameter: aParameter.
	visualization update
]

{ #category : #'execution-interaction' }
TLConnector >> executeRegularInteraction: anInteraction forDrawable: aTLDrawable [
	| visualization |
	visualization := aTLDrawable visualization.
	"we have to memorize the visualization because we are not sure the element will still be part of visualization after action"
	anInteraction regularActionIfNecessaryOn: aTLDrawable. 
	visualization update
]

{ #category : #'execution-interaction' }
TLConnector >> executeReverseInteraction: anInteraction forDrawable: aTLDrawable [
	| visualization |
	visualization := aTLDrawable visualization.
	"we have to memorize the visualization because we are not sure the element will still be part of visualization after action"
	anInteraction reverseActionIfNecessaryOn: aTLDrawable. 
	visualization update
]

{ #category : #accessing }
TLConnector >> findTriggerFor: aShapeInteraction forDrawable: aDrawable [
	^ self triggerForInteractionAndDrawable at: aShapeInteraction -> aDrawable
]

{ #category : #'generation - interaction' }
TLConnector >> generateBasicInteraction: aTLInteraction onNode: aTLNode [
	self subclassResponsibility
]

{ #category : #'generation - node' }
TLConnector >> generateChildrenOf: aCompositeNode [
	^ aCompositeNode childrenGroup generate.
]

{ #category : #'generation - interaction' }
TLConnector >> generateClickInteraction: aClickInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	self subclassResponsibility
]

{ #category : #'generation - node' }
TLConnector >> generateCompositeNode: aCompositeNode [
	| parent |
	parent := self generateSimpleNode: aCompositeNode.
	(aCompositeNode expanded and: [ aCompositeNode hasChildren ]) ifTrue: [ self define: parent asParentFor: (self generateChildrenOf: aCompositeNode) ].
	^ parent
]

{ #category : #'generation - connection' }
TLConnector >> generateConnection: aTLConnection [
	| shape |
	aTLConnection isVisible ifFalse: [ ^ self ].

	shape := self createElementConnection: aTLConnection From: aTLConnection fromNode to: aTLConnection toNode.
	self
		addElementConnectionInView: shape;
		registerShape: shape forDrawable: aTLConnection;
		generateInteractionsOf: aTLConnection targetingDrawable: aTLConnection.
	^ shape
]

{ #category : #'generation - interaction' }
TLConnector >> generateDoubleClickInteraction: aDoubleClickInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	self subclassResponsibility
]

{ #category : #'generation - interactions' }
TLConnector >> generateDropInteraction: aTLDropInteraction onDrawable: aTLSimpleNode targetingDrawable: aTLSimpleNode3 [ 
	self subclassResponsibility 
]

{ #category : #'generation - interaction' }
TLConnector >> generateExternalTriggerInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	self subclassResponsibility
]

{ #category : #'generation - group' }
TLConnector >> generateGroup: aTLGroup [
	| group |
	group := self
		createGroup: aTLGroup
		with:
			(aTLGroup telescopeEntities
				select: #isVisible
				thenCollect: [ :aTLConnectable | 
					self
						elementFromTLDrawable: aTLConnectable
						ifPresent: [ :element | 
							"If a node already exist, just remove it and regenerate it."
							aTLConnectable
								removeWith: self;
								generate ]
						ifNone: [ aTLConnectable generate ] ]).
	self registerShape: group forDrawable: aTLGroup.
	self applyLayoutOf: aTLGroup on: group.
	^ group
]

{ #category : #'generation - connection' }
TLConnector >> generateIfNecessaryConnectionsOf: aNode [
	self generateIfNecessaryIncomingConnectionsOf: aNode.
	self generateIfNecessaryOutgoingConnectionsOf: aNode
]

{ #category : #'generation - connection' }
TLConnector >> generateIfNecessaryIncomingConnectionsOf: aNode [
	aNode incomingConnections
		do: [ :connection | 
			[ 
			self elementFromTLDrawable: connection fromNode.
			(self shapeByDrawable includesKey: connection)
				ifFalse: [ connection generate ] ]
				on: NotFound
				do: [  ] ]
]

{ #category : #'generation - connection' }
TLConnector >> generateIfNecessaryOutgoingConnectionsOf: aNode [
	aNode outgoingConnections
		do: [ :connection | 
			[ 
			self elementFromTLDrawable: connection toNode.
			(self shapeByDrawable includesKey: connection)
				ifFalse: [ connection generate ] ]
				on: NotFound
				do: [  ] ]
]

{ #category : #'generation - interaction' }
TLConnector >> generateInteractionsOf: aDrawable targetingDrawable: aTargetDrawable [
	aDrawable allInteractions
		select: [ :anInteraction | anInteraction condition value: aTargetDrawable ]
		thenDo: [ :anInteraction | anInteraction generateWith: self on: aDrawable targeting: aTargetDrawable ]
]

{ #category : #'generation - legend' }
TLConnector >> generateLegend: aTLLegend [
	| legend |
	legend := self createLegendFrom: (aTLLegend legendEntries collect: [ :entry | entry generateWith: self  ]).
	self addElementLegendInView: legend.
	self registerShape: legend forDrawable: aTLLegend.
	^ legend
]

{ #category : #'generation - legend' }
TLConnector >> generateLegendItem: aTLLegendItem [
	| legendItem |
	legendItem := self createElementLegendItemFrom: aTLLegendItem.
	self addElementLegendItemInView: legendItem.
	self registerShape: legendItem forDrawable: aTLLegendItem.
	self generateInteractionsOf: aTLLegendItem targetingDrawable: aTLLegendItem.
	^ legendItem
]

{ #category : #'generation - interaction' }
TLConnector >> generateMenuInteraction: aMenuInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
	| menu |
	self flag: 'Telescope should create the menu and let the connector install it'.
	menu := self menuInteractionByDrawable at: aTLDrawable
		ifAbsentPut: [ self createMenuFor: aTLDrawable ].
	menu add: aMenuInteraction title
		target: [ self executeInteraction: aMenuInteraction forDrawable: aTargetDrawable ]
		selector: #cull:
		argument: aTargetDrawable entity
	
]

{ #category : #'generation - interaction' }
TLConnector >> generateMouseOverInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: anObject [ 
	self subclassResponsibility
]

{ #category : #'generation - interaction' }
TLConnector >> generateMovedInteraction: aTLNodeMovedInteraction onDrawable: aDrawable targetingDrawable: aTargetDrawable [
	self subclassResponsibility
]

{ #category : #'generation - interaction' }
TLConnector >> generateMultiChoiceMenuInteraction: aTLMultiChoiceMenuInteraction onDrawable: aTLDrawable targeting: anotherDrawable [
	self subclassResponsibility
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateNodeBackgroundLegendEntry: aTLNodeBackgroundLegendEntry [ 
	^ self subclassResponsibility
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateNodeBorderColorLegendEntry: aLegendEntry [
	^ self subclassResponsibility
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateNodeShapeLegendEntry: aTLNodeShapeLegendEntry [ 
	^ self subclassResponsibility
]

{ #category : #'generation - interaction' }
TLConnector >> generatePopupInteraction: aTLPopupInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
	^ self subclassResponsibility 
]

{ #category : #'generation - interaction' }
TLConnector >> generateRightClickInteraction: aRightClickInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	self subclassResponsibility
]

{ #category : #'generation - interaction' }
TLConnector >> generateShapeInteraction: aTLShapeInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
	| triggerElement trigger |
	"Create a trigger for the drawable"
	trigger := (aTLShapeInteraction shapeTrigger copyForDrawable: aTargetDrawable).
	"Create graphic element"
	triggerElement := trigger generateWith: self.
	"place it"
	
	self
		placeElement: triggerElement
		correspondingToTrigger: trigger
		relativeToDrawable: aTLDrawable.
	"add it to the view"
	self addElementInteractionInView: triggerElement.
	"register the element in the connector"
	self registerShape: triggerElement forDrawable: trigger.
	"register the interaction on the drawable"
	(self registerInteraction: aTLShapeInteraction withTrigger: trigger onDrawable: aTLDrawable).
	
	self generateInteractionsOf: trigger targetingDrawable: aTargetDrawable
]

{ #category : #'generation - node' }
TLConnector >> generateSimpleNode: aSimpleNode [
	| element |
	element := self createElementNodeFromNode: aSimpleNode.
	self addElementNodeInView: element.
	self registerShape: element forDrawable: aSimpleNode.
	self generateInteractionsOf: aSimpleNode targetingDrawable: aSimpleNode.
	self generateIfNecessaryConnectionsOf: aSimpleNode.
	^ element
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateTLBorderColorLegendEntry: aTLBorderColorLegendEntry [ 
	^ self subclassResponsibility
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateTLBorderShapeLegendEntry: aTLBorderShapeLegendEntry [ 
	^ self subclassResponsibility
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateTLColorLegendEntry: aTLColorLegendEntry [ 
	^ self subclassResponsibility
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateTLGradientLegendEntry: aTLGradientLegendEntry [ 
	^ self subclassResponsibility .
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateTLHeightLegendEntry: aTLHeightLegendEntry [ 
	^ self subclassResponsibility
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateTLStyleSheetLegendEntry: aTLStyleSheetLegendEntry [ 
	^ self subclassResponsibility 
]

{ #category : #'generation-legendEntry' }
TLConnector >> generateTLWidthLegendEntry: aTLWidthLegendEntry [ 
	^ self subclassResponsibility 
]

{ #category : #'generation - interaction' }
TLConnector >> generateTrigger: aTLShapeTrigger [
	^ self createElementFromTrigger: aTLShapeTrigger.
]

{ #category : #'generation - group' }
TLConnector >> generateVisualization: aTLVisualization [
	self displayGroupElement: (self generateGroup: aTLVisualization).
	aTLVisualization legend generateWith: self.
	self postGenerationFor: aTLVisualization	"the connection is not managed because it does not exist"
]

{ #category : #initialization }
TLConnector >> initialize [
	super initialize.
	self shapeByDrawable: Dictionary new.
	self menuInteractionByDrawable: Dictionary new.
	self interactionsByDrawable: Dictionary new.
	self triggerForInteractionAndDrawable: Dictionary new.
]

{ #category : #accessing }
TLConnector >> interactionsByDrawable [
	^ interactionsByDrawable
]

{ #category : #accessing }
TLConnector >> interactionsByDrawable: anObject [
	interactionsByDrawable := anObject
]

{ #category : #accessing }
TLConnector >> menuInteractionByDrawable [
	^ menuInteractionByDrawable
]

{ #category : #accessing }
TLConnector >> menuInteractionByDrawable: anObject [
	menuInteractionByDrawable := anObject
]

{ #category : #accessing }
TLConnector >> nodesShapesAvailableForConnector [
	"I should return all Telescope shapes that can apply on a node for this connector."
	
	^ self subclassResponsibility
]

{ #category : #opening }
TLConnector >> open: aTLVisualization inWindowSized: aDimension titled: aString [ 
	self subclassResponsibility 
]

{ #category : #layout }
TLConnector >> placeElement: anAssociation correspondingToTrigger: aTLShapeTrigger relativeToDrawable: aTLSimpleNode [ 
	self subclassResponsibility 
]

{ #category : #'generation - group' }
TLConnector >> postGenerationFor: aTLVisualization [
	
]

{ #category : #'consistency-dictionaries' }
TLConnector >> registerInteraction: aTLInteraction onDrawable: aTLDrawable [ 
	(self interactionsByDrawable at: aTLDrawable ifAbsentPut: [OrderedCollection new]) add: aTLInteraction.
]

{ #category : #'consistency-dictionaries' }
TLConnector >> registerInteraction: aTLInteraction withTrigger: aTLTrigger onDrawable: aTLDrawable [ 
	self registerInteraction: aTLInteraction onDrawable: aTLDrawable.
	self triggerForInteractionAndDrawable at: aTLInteraction -> aTLDrawable put: aTLTrigger.
]

{ #category : #accessing }
TLConnector >> registerShape: element forDrawable: aDrawable [
	self shapeByDrawable at: aDrawable put: element
]

{ #category : #'removing - node' }
TLConnector >> removeChildrenOf: aCompositeNode [
	aCompositeNode childrenGroup removeWith: self.
]

{ #category : #'removing - node' }
TLConnector >> removeCompositeNode: aNode [
	aNode expanded
		ifTrue: [ 
			[ aNode childrenGroup removeWith: self ]
				on: KeyNotFound
				do: [  ] ].
	self removeSimpleNode: aNode
]

{ #category : #'removing - connection' }
TLConnector >> removeConnection: aTLConnection [
	| shape |
	
	shape := self elementFromTLDrawable: aTLConnection.
	self removeElementConnectionFromView: shape.
	self unregisterShapeForDrawable: aTLConnection.
	self removeInteractionsOf: aTLConnection
]

{ #category : #view }
TLConnector >> removeElementConnectionFromView: element [
	self subclassResponsibility
]

{ #category : #'drawing - removing' }
TLConnector >> removeElementFromView: element associatedToDrawable: aTLDrawable [ 
	self subclassResponsibility 
]

{ #category : #view }
TLConnector >> removeElementLegendItemFromView: element [
	self subclassResponsibility
]

{ #category : #view }
TLConnector >> removeElementnteractionFromView: element [
	self subclassResponsibility
]

{ #category : #'removing - group' }
TLConnector >> removeGroup: aTLGroup [
	(self shapeByDrawable includesKey: aTLGroup) ifFalse: [ ^ self ].

	aTLGroup telescopeEntities do: [ :aTLConnectable | aTLConnectable removeWith: self ].
	self unregisterShapeForDrawable: aTLGroup
]

{ #category : #'removing - interaction' }
TLConnector >> removeInteractionsOf: aDrawable [
	(self interactionsByDrawable removeKey: aDrawable ifAbsent: [ #() ])
		do: [ :interaction | interaction removeWith: self forDrawable: aDrawable ].
	self menuInteractionByDrawable removeKey: aDrawable ifAbsent: [  ]
]

{ #category : #'removing - legend' }
TLConnector >> removeLegend: aTLLegend [ 
	self subclassResponsibility 
]

{ #category : #'removing - interaction' }
TLConnector >> removeShapeInteraction: aTLShapeInteraction forDrawable: aTLDrawable [
	"here we are removing the trigger from the connector after asked to it to remove from the view"
	(self triggerForInteractionAndDrawable removeKey: aTLShapeInteraction -> aTLDrawable) removeWith: self
]

{ #category : #'removing - node' }
TLConnector >> removeSimpleNode: aNode [
	[ | element |
	element := self elementFromTLDrawable: aNode.
	self removeElementFromView: element associatedToDrawable: aNode.
	self unregisterShapeForDrawable: aNode.
	self removeInteractionsOf: aNode.
	aNode connections
		do: [ :aConnection | 
			[ aConnection removeWith: self ]
				on: KeyNotFound
				do: [ "Here the connection was with another node still removed" ] ] ]
		on: KeyNotFound
		do: [ "A node might not be visible on the visualisation and thus does not have a shape" self flag: #toCheck. "Cyril: There was a bug here but I don't know Telescope enough to be 100% sure of waht to do." ]
]

{ #category : #'removing - interaction' }
TLConnector >> removeTrigger: aTLShapeTrigger [ 
	| element |
	[element := self elementFromTLDrawable: aTLShapeTrigger.
	self removeElementFromView: element associatedToDrawable: aTLShapeTrigger.
	self unregisterShapeForDrawable: aTLShapeTrigger.
	self removeInteractionsOf: aTLShapeTrigger.] on: KeyNotFound do: [  ]
]

{ #category : #accessing }
TLConnector >> shapeByDrawable [
	^ shapeByDrawable
]

{ #category : #accessing }
TLConnector >> shapeByDrawable: anObject [
	shapeByDrawable := anObject
]

{ #category : #accessing }
TLConnector >> tlDrawableFromElement: element [
	^ self shapeByDrawable keyAtValue: element
]

{ #category : #accessing }
TLConnector >> triggerForInteractionAndDrawable [
	^ triggerForInteractionAndDrawable
]

{ #category : #accessing }
TLConnector >> triggerForInteractionAndDrawable: anObject [
	triggerForInteractionAndDrawable := anObject
]

{ #category : #accessing }
TLConnector >> unregisterShapeForDrawable: aDrawable [
	self shapeByDrawable removeKey: aDrawable
]

{ #category : #'updating - connection' }
TLConnector >> updateAllConnections [
	self shapeByDrawable copy
		keysDo: [ :drawable | 
			drawable isConnection
				ifTrue: [ 
					((drawable fromNode isNil or: [ drawable toNode isNil ]) or: [ drawable isVisible not ])
						ifTrue: [ self removeConnection: drawable ] ifFalse: [ drawable updateWith: self ] ] ]
]

{ #category : #'updating - node' }
TLConnector >> updateChildrenOf: aCompositeNode [
	[ aCompositeNode childrenGroup update ]
		on: KeyNotFound
		do: [ self define: (self elementFromTLDrawable: aCompositeNode) asParentFor: (self generateChildrenOf: aCompositeNode) ]
]

{ #category : #'updating - node' }
TLConnector >> updateCompositeNode: aNode [
	aNode isUpdateRequired ifFalse: [ ^ self ].

	self updateSimpleNode: aNode.
	aNode expanded
		ifTrue: [ self updateChildrenOf: aNode ]
		ifFalse: [ self removeChildrenOf: aNode ]
]

{ #category : #'updating - connection' }
TLConnector >> updateConnection: aConnection [
	aConnection isUpdateRequired
		ifTrue: [ 
			[ 
			self updateInteractionsOf: aConnection.
			self updateEdgeOf: aConnection.
			aConnection updateDone ]
				on: KeyNotFound
				do: [ aConnection generate ] ]
]

{ #category : #'updating - connection' }
TLConnector >> updateConnectionsOf: aNode [
	|connectionUpdatingBlock|

	connectionUpdatingBlock := [ :connection | [connection updateWith: self] on: KeyNotFound do: [ "here the connection has not been generated before so is unknown for the connector"[connection generateWith: self] on: NotFound do: [ "in that case the other node is not yet generated" ] ] ].

	aNode incomingConnections do: connectionUpdatingBlock.
	aNode outgoingConnections do: connectionUpdatingBlock
]

{ #category : #'updating - connection' }
TLConnector >> updateEdgeOf: aConnection [
	self subclassResponsibility 
]

{ #category : #'updating - node' }
TLConnector >> updateElementNodeOf: aDrawable [
	self subclassResponsibility 
]

{ #category : #'updating - group' }
TLConnector >> updateGroup: aTLGroup [
	aTLGroup isUpdateRequired
		ifTrue: [ 
			| graphicGroup order |
			graphicGroup := self elementFromTLDrawable: aTLGroup.	
			"cleaning phase"
			graphicGroup
				removeAllSuchThat: [ :aDrawableGraphic | 
					| tlDrawable |
					tlDrawable := self tlDrawableFromElement: aDrawableGraphic.
					((aTLGroup includes: tlDrawable) and: [tlDrawable isVisible])
						ifTrue: [ 
							"element is still existing so should not be removed"
							false ]
						ifFalse: [ 
							"If the drawable has no parent anymore or is hyde it should be removed from visualization"
							(tlDrawable parent isNil or: [tlDrawable isVisible not]) ifTrue: [ tlDrawable removeWith: self ].	"element does not exist anymore so should be removed"
							true ] ].	
			"adding phase"
			graphicGroup
				addAllFirstUnlessAlreadyPresent:
					(aTLGroup select: #isVisible thenCollect: [ :aTLDrawable |  self elementFromTLDrawable: aTLDrawable ifPresent: [ :element | aTLDrawable updateWith: self. element ] ifNone: [ aTLDrawable generate ] ]).	
			"sorting phase"
			order := aTLGroup select: #isVisible
						thenCollect: [ :aTLDrawable | self elementFromTLDrawable: aTLDrawable ].
			graphicGroup sort: [ :a :b | (order indexOf: a) < (order indexOf: b) ].
			aTLGroup updateDone ]
		ifFalse:
			[aTLGroup isLayoutApplicationRequired ifTrue: ["In that case, layout application is required but not updating so we iterate over subelements" aTLGroup do: [ :aTLDrawable | aTLDrawable updateWith: self ] ]].
	aTLGroup isLayoutApplicationRequired
		ifFalse: [ ^ self ].
	aTLGroup layout ifNotNil: [ self applyLayoutOf: aTLGroup on: (self elementFromTLDrawable: aTLGroup) ].
	aTLGroup layoutApplicationDone
]

{ #category : #'updating - interaction' }
TLConnector >> updateInteractionsOf: aDrawable [
	self subclassResponsibility
]

{ #category : #'updating - legend' }
TLConnector >> updateLegend: aTLLegend [
	self subclassResponsibility 
]

{ #category : #'updating - interaction' }
TLConnector >> updateShapeInteraction: aShapeInteraction forDrawable: aDrawable [
	(self findTriggerFor: aShapeInteraction forDrawable: aDrawable) updateWith: self
]

{ #category : #'updating - interaction' }
TLConnector >> updateShapeTrigger: aTLShapeTrigger [
	self subclassResponsibility
]

{ #category : #'updating - node' }
TLConnector >> updateSimpleNode: aNode [
	self generateIfNecessaryConnectionsOf: aNode.

	aNode isUpdateRequired ifFalse: [ ^ self ].
	
	self updateInteractionsOf: aNode.
	self updateElementNodeOf: aNode.
	self updateConnectionsOf: aNode.
	aNode updateDone
]

{ #category : #view }
TLConnector >> updateViewForVisualization: aTLVisualization [
	self subclassResponsibility
]

{ #category : #'updating - group' }
TLConnector >> updateVisualization: aTLVisualization [
	self updateAllConnections.
	self updateGroup: aTLVisualization.
	aTLVisualization legend updateWith: self.
	self updateViewForVisualization: aTLVisualization
]
