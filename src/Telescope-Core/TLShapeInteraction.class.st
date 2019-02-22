"
A TLShapeInteraction is an interaction that will create a right-clickable shape that will execute an action on click.

Instance Variables
	shapeManager:		<Object>

shapeManager
	- xxxxx

"
Class {
	#name : #TLShapeInteraction,
	#superclass : #TLInteraction,
	#instVars : [
		'shapeTrigger'
	],
	#category : #'Telescope-Core-Interactions'
}

{ #category : #'secondary-interaction' }
TLShapeInteraction >> addSecondaryInteraction: aTLInteraction [
	self shapeTrigger addSecondaryInteraction: aTLInteraction
]

{ #category : #generate }
TLShapeInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: aTargetDrawable [
	aTLConnector generateShapeInteraction: self onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
]

{ #category : #initialization }
TLShapeInteraction >> initialize [
	super initialize.
	self shapeTrigger: TLShapeTrigger new.
]

{ #category : #testing }
TLShapeInteraction >> isGraphicallyRepresented [
	^ true
]

{ #category : #accessor }
TLShapeInteraction >> kind [
	^ #shape
]

{ #category : #interactions }
TLShapeInteraction >> onClick [
	self shapeTrigger onClick
]

{ #category : #removing }
TLShapeInteraction >> removeWith: aTLRoassal2Connector forDrawable: aDrawable [ 
	aTLRoassal2Connector removeShapeInteraction: self forDrawable: aDrawable
]

{ #category : #accessing }
TLShapeInteraction >> shapeTrigger [
	^ shapeTrigger
]

{ #category : #accessing }
TLShapeInteraction >> shapeTrigger: aShapeTrigger [
	shapeTrigger := aShapeTrigger.
	aShapeTrigger shapeInteraction: self
]

{ #category : #updating }
TLShapeInteraction >> updateWith: aConnector forDrawable: aDrawable [
	aConnector updateShapeInteraction: self forDrawable: aDrawable
]

{ #category : #interactions }
TLShapeInteraction >> withMenu: aString [
	self shapeTrigger withMenu: aString
]

{ #category : #interactions }
TLShapeInteraction >> withTriggerStyle: aSymbolOrBlockClosure [ 
	self shapeTrigger
		initialStyle: aSymbolOrBlockClosure
]

{ #category : #action }
TLShapeInteraction >> withTriggerStyled: aStyleOrStyleSheetCustomizationBlock thatBecome: anotherStyleOrStyleSheetCustomizationBlock [
	self shapeTrigger
		initialStyle: aStyleOrStyleSheetCustomizationBlock;
		secondStyle: anotherStyleOrStyleSheetCustomizationBlock
]
