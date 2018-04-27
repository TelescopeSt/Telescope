"
TLCytoscapeConnector is the connector for the cytoscape library (maybe in the future for any supported web browser library).

It creates some TLVisualizationServerCommands to send to the client actions to execute

  Instance Variables
	movedNodesRelativePositionByElement:		<Dictionary>
			I store the positions relative to its parent for each element that have been manually moved by the user
"
Class {
	#name : #TLCytoscapeConnector,
	#superclass : #TLConnector,
	#instVars : [
		'id',
		'commandsQueue',
		'visuId',
		'drawablesById',
		'visuCallBack',
		'visuCallBackUrl',
		'movedNodesRelativePositionByElement'
	],
	#category : 'Telescope-Cytoscape-Connector'
}

{ #category : #accessing }
TLCytoscapeConnector class >> priority [
	^ 3
]

{ #category : #commands }
TLCytoscapeConnector >> addCommand: aTLVisualizationServerCommand [
	self commandsQueue addCommand: aTLVisualizationServerCommand
]

{ #category : #view }
TLCytoscapeConnector >> addElementConnectionInView: element [
	
]

{ #category : #view }
TLCytoscapeConnector >> addElementInteractionInView: element [
	"No need in virtual hierarchy"
]

{ #category : #view }
TLCytoscapeConnector >> addElementLegendInView: legend [
	"Here we have nothing to do because we sent commands for entries creation before"
]

{ #category : #view }
TLCytoscapeConnector >> addElementLegendItemInView: legendItem [
	self shouldBeImplemented
]

{ #category : #view }
TLCytoscapeConnector >> addElementNodeInView: element [
	"do nothing because we want to send pack of datas"
]

{ #category : #layout }
TLCytoscapeConnector >> applyLayoutOf: aTLGroup on: group [
	self commandsQueue managePositioningOf: group.
	group restoreElementsPosition.
	[ aTLGroup layout on: group ]
		on: TLNodeDimensionChanged
		do: [ :notification | 
			self
				addCommand:
					(TLVisualizationCustomizeElementCommand new
						virtualNode: notification node;
						visuId: self visuId;
						style:
								{(#width -> notification node width).
									(#height -> notification node height)} asDictionary).
			notification resume ]
]

{ #category : #'instance creation' }
TLCytoscapeConnector >> closeVisualization [
	TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to close visualization in cytoscape'
]

{ #category : #accessing }
TLCytoscapeConnector >> commandsQueue [
	^ commandsQueue
]

{ #category : #accessing }
TLCytoscapeConnector >> commandsQueue: anObject [
	commandsQueue := anObject
]

{ #category : #'generation - connection' }
TLCytoscapeConnector >> createElementConnection: aTLConnection From: fromNode to: toNode [
	| edgeId |
	edgeId := self generateDrawableId.
	
	self addCommand:  (TLVisualizationAddEdgeCommand new
		edgeId: edgeId;
		mouseOverInteraction: (aTLConnection allInteractions anySatisfy: #isMouseOver);
				
		fromNodeId: (self elementFromTLDrawable: fromNode) nodeId;
		toNodeId: (self elementFromTLDrawable: toNode) nodeId;
		style: (aTLConnection effectiveStyleSheet cytoscapeConnectionStyleFor: aTLConnection) ;
		visuId: self visuId).
	
	^ edgeId
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> createElementFromTrigger: aTrigger [
	| styleSheet nodeId virtualTrigger virtualNodeReference |
	nodeId := self generateDrawableId.
	virtualNodeReference := self elementFromTLDrawable: aTrigger referencedElement.
	styleSheet := aTrigger effectiveStyleSheet.
	self flag: #TODO.	"Check if we should provide aTrigger in #obtainValue"
	virtualTrigger := TLVirtualTrigger new
		nodeId: nodeId;
		realNode: aTrigger;
		dimension:
				(styleSheet obtainValue: #width forEntity: nil inNode: aTrigger)
						@ (styleSheet obtainValue: #height forEntity: nil inNode: aTrigger);
		triggerPosition: styleSheet triggerPosition;
		yourself.
	virtualNodeReference addTrigger: virtualTrigger.
	self flag: #TODO.	"virtualTrigger is uninitialized at this point, BUG?"
	self
		addCommand:
			(TLVisualizationAddTriggerCommand new
				mouseOverInteraction: (aTrigger allInteractions anySatisfy: #isMouseOver);
				visuId: self visuId;
				style: (styleSheet cytoscapeNodeStyleFor: aTrigger referencedElement);
				virtualNodeReference: virtualNodeReference;
				virtualTrigger: virtualTrigger;
				yourself).
	^ virtualTrigger
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> createElementLegendItemFrom: aTLLegendItem [
	self shouldBeImplemented
]

{ #category : #'generation - node' }
TLCytoscapeConnector >> createElementNodeFromNode: aNode [
	| styleSheet nodeId virtualNode |
	nodeId := self generateDrawableId.
	styleSheet := aNode effectiveStyleSheet.
	virtualNode := TLVirtualNode new
		nodeId: nodeId;
		realNode: aNode;
		dimension:
				(styleSheet obtainValue: #width forEntity: aNode entity inNode: aNode)
						@ (styleSheet obtainValue: #height forEntity: aNode entity inNode: aNode);
		position: 0 @ 0;
		yourself.	"temp  position for creation"
	self tryToFixPositionFor: virtualNode styleSheet: styleSheet node: aNode.
	self
		addCommand:
			(TLVisualizationAddNodeCommand new
				virtualNode: virtualNode;
				customizeFromInteractions: aNode allInteractions forNode: aNode;
				visuId: self visuId;
				style: (styleSheet cytoscapeNodeStyleFor: aNode)).
	^ virtualNode
]

{ #category : #'generation - group' }
TLCytoscapeConnector >> createGroup: aTLGroup with: aCollectionOfDrawableId [
	"just have to return collection"
	
	^ TLVirtualGroup withAll: aCollectionOfDrawableId
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> createLegendFrom: legendEnties [
	"Nothing to do here"
]

{ #category : #'generation - node' }
TLCytoscapeConnector >> define: parentCompositeElement asParentFor: aCollectionOfChildrenElements [
	aCollectionOfChildrenElements parent: parentCompositeElement
]

{ #category : #accessing }
TLCytoscapeConnector >> drawablesById [
	^ drawablesById
]

{ #category : #accessing }
TLCytoscapeConnector >> drawablesById: anObject [
	drawablesById := anObject
]

{ #category : #callback }
TLCytoscapeConnector >> executeAJAXCallBack: callbackURL onDrawable: aDrawable  onElement: aCssSelector [
		"ask the client to execute it"
	self
		addCommand:
			(TLVisualizationAJAXCallBackExecutionCommand new
				callbackUrl:  callbackURL;
				cssQuery: aCssSelector;
				yourself)
]

{ #category : #callback }
TLCytoscapeConnector >> executeCallBack: aBlockClosure onDrawable: aDrawable newTab: openInNewTab [
	"first we should parameter the callback"

	self visuCallBack block: [ :anything | aBlockClosure value: aDrawable ].	"then ask the client to execute it"
	self
		addCommand:
			(TLVisualizationRequireCallBackExecutionCommand new
				callbackUrl: self visuCallBackUrl;
				openInNewTab: openInNewTab;
				yourself)
]

{ #category : #'executing - interaction' }
TLCytoscapeConnector >> executeDropInteraction: aDroppedDrawableId onDrawableId: aTargetDrawableId [
	| targetDrawable visualization |
	targetDrawable := self tlDrawableFromId: aTargetDrawableId.
	visualization := targetDrawable visualization.
	(targetDrawable allValidInteractionsOfKind: TLDropInteraction)
		do: [ :anInteraction | anInteraction actionOn: targetDrawable parameter: (self tlDrawableFromId: aDroppedDrawableId) ].
	visualization update
]

{ #category : #'executing - interaction' }
TLCytoscapeConnector >> executeExternalTrigger: aTriggerId [
	| drawables |
	drawables := self drawablesById.	"get visualizations to avoid many union of inherit interactions"
	drawables
		detect: [ :aDrawables | aDrawables visualization notNil ]
		ifFound: [ :aNode | 
			aNode visualization allInteractions
				select: [ :anInteraction | (anInteraction shouldOccursOn: #externalTrigger) and: [ anInteraction triggerId = aTriggerId ] ]
				thenDo: [ :anInteraction | 
					self
						executeInteraction: anInteraction
						forDrawables: (drawables select: [ :aDrawable | anInteraction shouldOccursOn: #externalTrigger with: aDrawable ]) ] ]
]

{ #category : #'executing - interaction' }
TLCytoscapeConnector >> executeInteraction: aKindOfInteraction onDrawableId: aDrawableId [
	| drawable interactions |
	drawable := self tlDrawableFromId: aDrawableId.
	interactions := drawable allInteractions select: [ :anInteraction | anInteraction shouldOccursOn: aKindOfInteraction with: drawable ].
	
	interactions ifEmpty: [ ^ self sendAcknowledgeReceiptFor: drawable referencedElement ].
	
	self flag: 'dirty, will need a refactor'.
	aKindOfInteraction = #mouseOver ifTrue: [ ^ interactions do: [ :anInteraction | self executeRegularInteraction: anInteraction forDrawable: drawable ] ].
	
	"For the mouse out we reverse the interactions to execute them in the reverse order in which we activated them. It can help for example for style customization interactions because if we do not reverse them , then we will have a problem reversing the styles."
	aKindOfInteraction = #mouseOut ifTrue: [ ^ interactions reverse do: [ :anInteraction | self executeReverseInteraction: anInteraction forDrawable: drawable ] ].
	
	interactions do: [ :anInteraction | self executeInteraction: anInteraction forDrawable: drawable referencedElement ]
]

{ #category : #interaction }
TLCytoscapeConnector >> executeMenuInteraction: anEntryIndex onDrawableId: aDrawableId [
	| drawable |
	drawable := self tlDrawableFromId: aDrawableId.
	self
		executeInteraction:
			((drawable allInteractions
				select: [ :anInteraction | anInteraction isMenu and: [ anInteraction condition value: drawable ] ]) at: anEntryIndex)
		forDrawable: drawable referencedElement
]

{ #category : #'executing - interaction' }
TLCytoscapeConnector >> executeMoveInteraction: aDrawablePosition onDrawableId: aDrawableId [
	| aDrawable |
	aDrawable := self tlDrawableFromId: aDrawableId.
	(self elementFromTLDrawable: aDrawable)
		in: [ :anElement | 
			self movedNodesRelativePositionByElement
				at: anElement
				put: (anElement calculateRelativePositionFromAbsolute: aDrawablePosition) ].
	(aDrawable allValidInteractionsOfKind: TLNodeMovedInteraction)
		do: [ :anInteraction | 
			self
				executeInteraction: anInteraction
				parameter: aDrawablePosition
				forDrawable: aDrawable referencedElement ]
]

{ #category : #'executing - interaction' }
TLCytoscapeConnector >> executeMultiChoice: aChoiceIndex menuInteraction: anEntryIndex onDrawableId: aDrawableId [
	| drawable |
	drawable := self tlDrawableFromId: aDrawableId.
	self
		executeChoice: aChoiceIndex
		interaction:
			((drawable allInteractions
				select: [ :anInteraction | anInteraction isMenu and: [ anInteraction condition value: drawable ] ]) at: anEntryIndex)
		forDrawable: drawable referencedElement
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generateBasicInteraction: aTLInteraction onNode: aTLNode [
	self flag: 'TO DO'
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generateClickInteraction: aClickInteraction onDrawable: aTLDrawable targetingDrawable: aTargetTLDrawable [
	self flag: 'should only register the association aTLDrawable->aTargetTLDrawable'
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generateDoubleClickInteraction: aDoubleClickInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	self shouldBeImplemented
]

{ #category : #drawableIds }
TLCytoscapeConnector >> generateDrawableId [
	id ifNil: [ id := 0 ].
	^ (id := id + 1) asString
]

{ #category : #'generation - interactions' }
TLCytoscapeConnector >> generateDropInteraction: aTLDropInteraction onDrawable: aTLSimpleNode targetingDrawable: aTLSimpleNode3 [ 
	"Nothing to do"
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generateExternalTriggerInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	"nothing to do"
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateLegend: aTLLegend [
	"In cytoscape, no need to add the whole legend to the visu, each item will be added separately"

	aTLLegend legendEntries do: [ :entry | entry generateWith: self ]
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generateMenuInteraction: aMenuInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
	"The node customization will do that"
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generateMouseOverInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	"nothing to do"
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generateMovedInteraction: aTLNodeMovedInteraction onDrawable: aDrawable targetingDrawable: aTargetDrawable [
	"Nothing to generate; the interaction will be triggered when the client will sent a move command"
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generateMultiChoiceMenuInteraction: aTLMultiChoiceMenuInteraction onDrawable: aTLDrawable targeting: anotherDrawable [
	"The node customization will do that"
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateNodeBackgroundLegendEntry: aTLNodeBackgroundLegendEntry [
	(aTLNodeBackgroundLegendEntry obtainAssociations
		collect: [ :collection | 
			| drawable |
			drawable := collection anyOne.
			drawable effectiveStyleSheet obtainValue: #backgroundColor forEntity: drawable entity inNode: drawable ])
		associationsDo: [ :labelAndColor | 
			self
				addCommand:
					(TLVisualizationAddLegendEntryCommand
						visuId: self visuId
						html:
							'<td class="tlLegendIcon" style="background-color:' , labelAndColor value forCytoscape
								, ';box-shadow: 0px 0px 5px -1px rgba(0,0,0,0.4);"></td><td class="tlLegendLabel">' , labelAndColor key , '</td>') ].
	^ aTLNodeBackgroundLegendEntry
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateNodeBorderColorLegendEntry: aLegendEntry [
	(aLegendEntry obtainAssociations
		collect: [ :collection | 
			| drawable |
			drawable := collection anyOne.
			drawable effectiveStyleSheet obtainValue: #borderColor forEntity: drawable entity inNode: drawable ])
		associationsDo: [ :labelAndColor | 
			self
				addCommand:
					(TLVisualizationAddLegendEntryCommand
						visuId: self visuId
						html:
							'<td class="tlLegendIcon" style="border: 2px solid ' , labelAndColor value forCytoscape
								, ';box-shadow: 0px 0px 5px -1px rgba(0,0,0,0.4);"></td><td class="tlLegendLabel">' , labelAndColor key , '</td>') ].
	^ aLegendEntry
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateNodeShapeLegendEntry: aLegendEntry [
	(aLegendEntry obtainAssociations
		collect: [ :collection | 
			| drawable |
			drawable := collection anyOne.
			drawable effectiveStyleSheet obtainValue: #shape forEntity: drawable entity inNode: drawable ])
		associationsDo: [ :labelAndColor | 
			self
				addCommand:
					(TLVisualizationAddLegendEntryCommand
						visuId: self visuId
						html:
							'<td class="tlLegendIcon""><img style="width: 30px;height: 30px;" src="' , (CYSFileLibrary urlOf: labelAndColor value iconName , '.png') asString
								, '"></td><td class="tlLegendLabel">' , labelAndColor key , '</td>') ].
	^ aLegendEntry
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generatePopupInteraction: aTLPopupInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
	self shouldBeImplemented
]

{ #category : #'generation - interaction' }
TLCytoscapeConnector >> generateRightClickInteraction: aRightClickInteraction onDrawable: aTLDrawable targetingDrawable: aTargetTLDrawable [
	"nothing to do because we manage interaction when the client send a request"
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateTLBorderColorLegendEntry: aTLBorderColorLegendEntry [
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLBorderColorLegendEntry cytoscapeHtmlRepresentation).
	^ aTLBorderColorLegendEntry
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateTLBorderShapeLegendEntry: aTLBorderShapeLegendEntry [
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLBorderShapeLegendEntry cytoscapeHtmlRepresentation).
	^ aTLBorderShapeLegendEntry
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateTLColorLegendEntry: aTLColorLegendEntry [ 
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLColorLegendEntry cytoscapeHtmlRepresentation).
	^ aTLColorLegendEntry
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateTLGradientLegendEntry: aTLGradientLegendEntry [
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLGradientLegendEntry cytoscapeHtmlRepresentation).
	^ aTLGradientLegendEntry
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateTLHeightLegendEntry: aTLHeightLegendEntry [
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLHeightLegendEntry cytoscapeHtmlRepresentation).
	^ aTLHeightLegendEntry
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateTLStyleSheetLegendEntry: aTLStyleSheetLegendEntry [
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLStyleSheetLegendEntry cytoscapeHtmlRepresentation).
	^ aTLStyleSheetLegendEntry
]

{ #category : #'generation - legend' }
TLCytoscapeConnector >> generateTLWidthLegendEntry: aTLWidthLegendEntry [
	self
		addCommand:
			(TLVisualizationAddLegendEntryCommand visuId: self visuId html: aTLWidthLegendEntry cytoscapeHtmlRepresentation).
	^ aTLWidthLegendEntry
]

{ #category : #accessing }
TLCytoscapeConnector >> idForDrawable: aTLDrawable [
	^ self drawablesById keyAtValue: aTLDrawable 
]

{ #category : #initialization }
TLCytoscapeConnector >> initialize [
	super initialize.
	commandsQueue := TLCommandsQueue new.
	drawablesById := Dictionary new.
	movedNodesRelativePositionByElement := Dictionary new
]

{ #category : #accessing }
TLCytoscapeConnector >> movedNodesRelativePositionByElement [
	^ movedNodesRelativePositionByElement
]

{ #category : #accessing }
TLCytoscapeConnector >> movedNodesRelativePositionByElement: anObject [
	movedNodesRelativePositionByElement := anObject
]

{ #category : #opening }
TLCytoscapeConnector >> open: aTLVisualization inWindowSized: aPoint titled: aString [ 
	aTLVisualization openOnWeb
]

{ #category : #placing }
TLCytoscapeConnector >> placeElement: anAssociation correspondingToTrigger: aTLShapeTrigger relativeToDrawable: aTLSimpleNode [
	"Do nothing because virtual hierarchy will do it"
]

{ #category : #'generation - group' }
TLCytoscapeConnector >> postGenerationFor: aTLVisualization [
	self
		addCommand:
			(TLVisualizationGeneratedCommand
				new
				visuId: self visuId;
				yourself).
	TLCytoscapeWebSocketDelegate delegate sendCommands: self removeAllCommands forVisu: aTLVisualization
]

{ #category : #accessing }
TLCytoscapeConnector >> registerShape: element forDrawable: aDrawable [
	super registerShape: element forDrawable: aDrawable.
	[ 
	self drawablesById
		at:
			(element isString
				ifTrue: [ element ]
				ifFalse: [ element id ])
		put: aDrawable ]
		on: MessageNotUnderstood
		do: [  ]
]

{ #category : #commands }
TLCytoscapeConnector >> removeAllCommands [
	^ self commandsQueue removeAllCommands
]

{ #category : #'removing - node' }
TLCytoscapeConnector >> removeChildrenOf: aCompositeNode [
	super removeChildrenOf: aCompositeNode.	"we need also to remove it in the virtual hierarchy"
	(self elementFromTLDrawable: aCompositeNode) children removeAll
]

{ #category : #view }
TLCytoscapeConnector >> removeElementConnectionFromView: element [
	self
		addCommand:
			(TLVisualizationRemoveElementCommand new
				visuId: self visuId;
				nodeId: element;
				yourself)
]

{ #category : #'drawing - removing' }
TLCytoscapeConnector >> removeElementFromView: element associatedToDrawable: aTLDrawable [
	self
		addCommand:
			(TLVisualizationRemoveElementCommand new
				visuId: self visuId;
				nodeId: element nodeId;
				yourself)
]

{ #category : #view }
TLCytoscapeConnector >> removeElementLegendItemFromView: element [
	self shouldBeImplemented
]

{ #category : #view }
TLCytoscapeConnector >> removeElementnteractionFromView: element [
	self shouldBeImplemented
]

{ #category : #'removing - legend' }
TLCytoscapeConnector >> removeLegend: aTLLegend [
	self addCommand: (TLVisualizationRemoveLegendCommand new visuId: self visuId)
]

{ #category : #'executing - interaction' }
TLCytoscapeConnector >> sendAcknowledgeReceiptFor: aTLDrawable [
	self commandsQueue addCommand: (TLAcknowledgeReceiptCommand new visuId: self visuId).
	aTLDrawable visualization ifNotNil:[aTLDrawable visualization update] ifNil:["probably a missclic on a deleted link/node by previous interaction but the clic is possible when lag in interface or network "]
]

{ #category : #accessing }
TLCytoscapeConnector >> tlDrawableFromId: anId [
	^ self drawablesById at: anId
]

{ #category : #'generation - node' }
TLCytoscapeConnector >> tryToFixPositionFor: virtualNode styleSheet: styleSheet node: aNode [
	[ virtualNode defineFixedRelativePosition: (styleSheet obtainValue: #position forEntity: aNode entity inNode: aNode) ]
		on: TLStyleSheetMissingProperty
		do: [  ]
]

{ #category : #accessing }
TLCytoscapeConnector >> unregisterShapeForDrawable: aDrawable [
	super unregisterShapeForDrawable: aDrawable.
	self drawablesById keysAndValuesRemove: [ :shape :drawable | aDrawable = drawable ].
]

{ #category : #'updating - connection' }
TLCytoscapeConnector >> updateEdgeOf: aConnection [
	self
		addCommand:
			(TLVisualizationCustomizeConnectionCommand new
				connectionId: (self idForDrawable: aConnection);
				mouseOverInteraction: (aConnection allInteractions anySatisfy: #isMouseOver);
		
				visuId: self visuId;
				style: (aConnection effectiveStyleSheet cytoscapeConnectionStyleFor: aConnection))
]

{ #category : #'updating - node' }
TLCytoscapeConnector >> updateElementNodeOf: aDrawable [
	| element |
	element := self elementFromTLDrawable: aDrawable. 
	aDrawable hierarchyChanged
		ifTrue: [ 
			self
				addCommand:
					(TLVisualizationRefreshNodeCommand new
						virtualNode: element;
						customizeFromInteractions: aDrawable allInteractions forNode: aDrawable;
						visuId: self visuId;
						style: (aDrawable effectiveStyleSheet cytoscapeNodeStyleFor: aDrawable)) ]
		ifFalse: [ 
			self
				addCommand:
					(TLVisualizationCustomizeElementCommand new
						virtualNode: element;
						mouseOverInteraction: (aDrawable allInteractions anySatisfy: #isMouseOver);
						visuId: self visuId;
						style: (aDrawable effectiveStyleSheet cytoscapeNodeStyleFor: aDrawable)) ].
		self commandsQueue managePositioningOf: element triggers
]

{ #category : #'updating - interaction' }
TLCytoscapeConnector >> updateInteractionsOf: aDrawable [
	self flag: #todo.	"Remove the interaction that are no longer needed and add the new ones."
	(aDrawable allInteractions select: #isGraphicallyRepresented)
		do: [ :aGraphicInteraction | aGraphicInteraction updateWith: self forDrawable: aDrawable ]
]

{ #category : #'updating - legend' }
TLCytoscapeConnector >> updateLegend: aTLLegend [
	self flag: 'Can be smarter than just removing and recreating legend'.
	aTLLegend removeWith: self.
	aTLLegend generateWith: self.
]

{ #category : #nesting }
TLCytoscapeConnector >> updateNestOn: backElement nest: innerElements layout: layout [
	self shouldBeImplemented
]

{ #category : #'updating - interaction' }
TLCytoscapeConnector >> updateShapeTrigger: aShapeTrigger [
	self updateInteractionsOf: aShapeTrigger.
	self updateTriggerOf: aShapeTrigger
]

{ #category : #'updating - interaction' }
TLCytoscapeConnector >> updateTriggerOf: aShapeTrigger [ 
	self
		addCommand:
			(TLVisualizationCustomizeElementCommand new
				virtualNode: (self elementFromTLDrawable: aShapeTrigger);
				mouseOverInteraction: (aShapeTrigger allInteractions anySatisfy: #isMouseOver);
				visuId: self visuId;
				style: (aShapeTrigger effectiveStyleSheet cytoscapeTriggerStyleFor: aShapeTrigger))
]

{ #category : #view }
TLCytoscapeConnector >> updateViewForVisualization: aTLVisualization [
	TLCytoscapeWebSocketDelegate delegate sendCommands: self removeAllCommands forVisu: aTLVisualization
]

{ #category : #accessing }
TLCytoscapeConnector >> visuCallBack [
	^ visuCallBack
]

{ #category : #accessing }
TLCytoscapeConnector >> visuCallBack: anObject [
	visuCallBack := anObject
]

{ #category : #accessing }
TLCytoscapeConnector >> visuCallBackUrl [
	^ visuCallBackUrl
]

{ #category : #accessing }
TLCytoscapeConnector >> visuCallBackUrl: anObject [
	visuCallBackUrl := anObject
]

{ #category : #accessing }
TLCytoscapeConnector >> visuId [
	^ visuId
]

{ #category : #accessing }
TLCytoscapeConnector >> visuId: anObject [
	self commandsQueue visuId: anObject.
	visuId := anObject
]
