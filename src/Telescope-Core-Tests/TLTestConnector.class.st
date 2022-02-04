"
I am an implementation of the abstract class TLConnector used to create test on it.
"
Class {
	#name : #TLTestConnector,
	#superclass : #TLConnector,
	#instVars : [
		'view',
		'childrenByParent'
	],
	#category : #'Telescope-Core-Tests-Utils'
}

{ #category : #testing }
TLTestConnector class >> isRealConnector [
	^ false
]

{ #category : #accessing }
TLTestConnector class >> priority [
	^ 1
]

{ #category : #view }
TLTestConnector >> addElementConnectionInView: anAssociation [ 
	
]

{ #category : #view }
TLTestConnector >> addElementInteractionInView: element [ 
	self view add: element
]

{ #category : #view }
TLTestConnector >> addElementLegendInView: legend [
	"Here we have nothing to do"
]

{ #category : #view }
TLTestConnector >> addElementNodeInView: anElement [ 
	view add: anElement
]

{ #category : #layout }
TLTestConnector >> applyLayoutOf: aTLEntitiesGroup on: aCollection [ 
	"doNothing"
]

{ #category : #accessing }
TLTestConnector >> childrenByParent [
	^ childrenByParent
]

{ #category : #accessing }
TLTestConnector >> childrenByParent: anObject [
	childrenByParent := anObject
]

{ #category : #accessing }
TLTestConnector >> connectionHeadShapesAvailableForConnector [
	"I should return all Telescope shapes that can apply on a connection heads for this connector."

	^ TLSimpleShape allSubclasses
]

{ #category : #'generation - connection' }
TLTestConnector >> createElementConnection: aTLConnection From: aTLSimpleNode to: aTargetTLSimpleNode [
	^ aTLConnection -> (aTLSimpleNode -> aTargetTLSimpleNode)
]

{ #category : #'generation - interaction' }
TLTestConnector >> createElementFromTrigger: aTLShapeTrigger [ 
	^ aTLShapeTrigger -> #element
]

{ #category : #'generation - node' }
TLTestConnector >> createElementNodeFromNode: aTLSimpleNode [ 
	^ aTLSimpleNode -> #element
]

{ #category : #'generation - group' }
TLTestConnector >> createGroup: aGroup with: aCollection [ 
	^ aCollection as: OrderedCollection 
]

{ #category : #'generation - legend' }
TLTestConnector >> createLegendFrom: aCollection [ 
	"For now I do nothing. Change it if you want to test the legend"
]

{ #category : #'generation - node' }
TLTestConnector >> define: anAssociation asParentFor: children [ 
	self childrenByParent at: anAssociation key put: children
]

{ #category : #'generation - interaction' }
TLTestConnector >> generateClickInteraction: aTLClickInteraction onDrawable: aTLShapeTrigger targetingDrawable: aTLSimpleNode [ 
	
]

{ #category : #initialization }
TLTestConnector >> initialize [
	super initialize.
	view := OrderedCollection new.
	childrenByParent := Dictionary new.
]

{ #category : #accessing }
TLTestConnector >> nodesShapesAvailableForConnector [
	^ TLSimpleShape allSubclasses
]

{ #category : #placing }
TLTestConnector >> placeElement: anAssociation correspondingToTrigger: aTLShapeTrigger relativeToDrawable: aTLSimpleNode [ 
	
]

{ #category : #view }
TLTestConnector >> removeElementConnectionFromView: anAssociation [ 
	self shapeByDrawable removeKey: anAssociation key.
]

{ #category : #'drawing - removing' }
TLTestConnector >> removeElementFromView: anAssociation associatedToDrawable: aTLDrawable [
	self view remove: anAssociation.
]

{ #category : #'updating - node' }
TLTestConnector >> updateElementNodeOf: aTLSimpleNode [ 
	
]

{ #category : #'updating - interaction' }
TLTestConnector >> updateInteractionsOf: aTLCompositeNode [ 
	self flag: 'No interactions test in the fake now'
]

{ #category : #'updating - legend' }
TLTestConnector >> updateLegend: aTLStaticLegend [ 
	
]

{ #category : #view }
TLTestConnector >> updateViewForVisualization: aTLVisualization [ 
	
]

{ #category : #accessing }
TLTestConnector >> view [
	^ view
]

{ #category : #accessing }
TLTestConnector >> view: anObject [
	view := anObject
]
