"
I am an implementation of the abstract class TLConnector used to create test on it.
"
Class {
	#name : #TLConnectorTest,
	#superclass : #TLConnector,
	#instVars : [
		'view',
		'childrenByParent'
	],
	#category : #'Telescope-Core-Tests'
}

{ #category : #accessing }
TLConnectorTest class >> priority [
	^ 1
]

{ #category : #view }
TLConnectorTest >> addElementConnectionInView: anAssociation [ 
	
]

{ #category : #view }
TLConnectorTest >> addElementInteractionInView: element [ 
	self view add: element
]

{ #category : #view }
TLConnectorTest >> addElementLegendInView: legend [
	"Here we have nothing to do"
]

{ #category : #view }
TLConnectorTest >> addElementNodeInView: anElement [ 
	view add: anElement
]

{ #category : #layout }
TLConnectorTest >> applyLayoutOf: aTLEntitiesGroup on: aCollection [ 
	"doNothing"
]

{ #category : #accessing }
TLConnectorTest >> childrenByParent [
	^ childrenByParent
]

{ #category : #accessing }
TLConnectorTest >> childrenByParent: anObject [
	childrenByParent := anObject
]

{ #category : #'generation - connection' }
TLConnectorTest >> createElementConnection: aTLConnection From: aTLSimpleNode to: aTargetTLSimpleNode [
	^ aTLConnection -> (aTLSimpleNode -> aTargetTLSimpleNode)
]

{ #category : #'generation - interaction' }
TLConnectorTest >> createElementFromTrigger: aTLShapeTrigger [ 
	^ aTLShapeTrigger -> #element
]

{ #category : #'generation - node' }
TLConnectorTest >> createElementNodeFromNode: aTLSimpleNode [ 
	^ aTLSimpleNode -> #element
]

{ #category : #'generation - group' }
TLConnectorTest >> createGroup: aGroup with: aCollection [ 
	^ aCollection as: OrderedCollection 
]

{ #category : #'generation - legend' }
TLConnectorTest >> createLegendFrom: aCollection [ 
	"For now I do nothing. Change it if you want to test the legend"
]

{ #category : #'generation - node' }
TLConnectorTest >> define: anAssociation asParentFor: children [ 
	self childrenByParent at: anAssociation key put: children
]

{ #category : #'generation - interaction' }
TLConnectorTest >> generateClickInteraction: aTLClickInteraction onDrawable: aTLShapeTrigger targetingDrawable: aTLSimpleNode [ 
	
]

{ #category : #initialization }
TLConnectorTest >> initialize [
	super initialize.
	view := OrderedCollection new.
	childrenByParent := Dictionary new.
]

{ #category : #placing }
TLConnectorTest >> placeElement: anAssociation correspondingToTrigger: aTLShapeTrigger relativeToDrawable: aTLSimpleNode [ 
	
]

{ #category : #view }
TLConnectorTest >> removeElementConnectionFromView: anAssociation [ 
	self shapeByDrawable removeKey: anAssociation key.
]

{ #category : #'drawing - removing' }
TLConnectorTest >> removeElementFromView: anAssociation associatedToDrawable: aTLDrawable [
	self view remove: anAssociation.
]

{ #category : #'updating - node' }
TLConnectorTest >> updateElementNodeOf: aTLSimpleNode [ 
	
]

{ #category : #'updating - interaction' }
TLConnectorTest >> updateInteractionsOf: aTLCompositeNode [ 
	self flag: 'No interactions test in the fake now'
]

{ #category : #'updating - legend' }
TLConnectorTest >> updateLegend: aTLStaticLegend [ 
	
]

{ #category : #view }
TLConnectorTest >> updateViewForVisualization: aTLVisualization [ 
	
]

{ #category : #accessing }
TLConnectorTest >> view [
	^ view
]

{ #category : #accessing }
TLConnectorTest >> view: anObject [
	view := anObject
]
