Class {
	#name : #TLRoassal2ConnectorTests,
	#superclass : #BabyMock2TestCase,
	#instVars : [
		'connector',
		'view'
	],
	#category : 'Telescope-Roassal2-Tests'
}

{ #category : #running }
TLRoassal2ConnectorTests >> setUp [
	view := protocol mock: 'view'.
	connector := TLRoassal2Connector new.
	connector view: view.
]

{ #category : #'as yet unclassified' }
TLRoassal2ConnectorTests >> testAllShapesAreCustomizableWithDefaultStyleSheet [
	TLSimpleShape allSubclasses
		do: [ :aSubclass | 
			| shape |
			shape := connector generateShapeCorrespondingTo: aSubclass.
			connector customizeShape: shape withStyleSheet: (TLStyleSheet default nodeLabel: 'test') ]
]

{ #category : #'as yet unclassified' }
TLRoassal2ConnectorTests >> testAllShapesAreGenerable [
	TLSimpleShape allSubclasses
		do: [ :aSubclass | self deny: (connector generateShapeCorrespondingTo: aSubclass) isClass ]
]

{ #category : #'as yet unclassified' }
TLRoassal2ConnectorTests >> testReplaceCameraWhenUpdatingDisable [
	| visu |
	visu := TLVisualization new generator: connector.
	protocol describe once: view recv: #signalUpdate.
	visu update.
]

{ #category : #'as yet unclassified' }
TLRoassal2ConnectorTests >> testReplaceCameraWhenUpdatingEnable [
	| visu |
	visu := TLVisualization new generator: connector.
	visu replaceCameraWhenUpdating.
	protocol describe once: view recv: #updateAndAdjustCamera.
	visu update.
]

{ #category : #'as yet unclassified' }
TLRoassal2ConnectorTests >> testUpdateGroupWithOneDrawableRequiringLayoutApplication [
	| group node rtGroup rtNodeElement |
	group := TLEntitiesGroup new.
	group styleSheet layout: nil.
	rtNodeElement := protocol mock: 'rtElement'.
	rtGroup := OrderedCollection with: rtNodeElement.
	connector shapeByDrawable at: group put: rtGroup.
	node := protocol mock: 'node'.
	protocol describe once: node recv: #parent:; with: group.
	protocol describe allow: node recv: #isVisible; => true.

	group addDrawable: node.
	connector shapeByDrawable at: node put: rtNodeElement.

	protocol describe once: node recv: #updateWith:; => connector.

	connector updateGroup: group.
]
