"
A TLShapeTrigger is a shape displayed on the visualization that will trigger the action of a TLShapeInteraction.

"
Class {
	#name : #TLShapeTrigger,
	#superclass : #TLDrawable,
	#instVars : [
		'shapeInteraction',
		'secondStateStyle',
		'action',
		'referencedElement'
	],
	#category : #'Telescope-Core-Interactions'
}

{ #category : #accessing }
TLShapeTrigger >> action [
	^ action
]

{ #category : #accessing }
TLShapeTrigger >> action: anObject [
	action := anObject
]

{ #category : #accessing }
TLShapeTrigger >> addInteraction: aTLInteraction [
	self assert: aTLInteraction action = self action description: 'A trigger cannot have other action than the default one'.
	^ super addInteraction: aTLInteraction
]

{ #category : #interactions }
TLShapeTrigger >> addSecondaryInteraction: aTLInteraction [
	super addInteraction: aTLInteraction
]

{ #category : #interactions }
TLShapeTrigger >> allInteractions [
	"A trigger do not inherit interactions from parent"
	^ self interactions
]

{ #category : #copying }
TLShapeTrigger >> copyForDrawable: aTLDrawable [ 
	"We have to copy the trigger for each drawable where it will be applied"
	^ self copy referencedElement: aTLDrawable; yourself
]

{ #category : #style }
TLShapeTrigger >> defaultStyle [
	^ #shapeInteraction
]

{ #category : #hack }
TLShapeTrigger >> entity [
	^ nil
]

{ #category : #generation }
TLShapeTrigger >> generateWith: aConnector [
	| generated |
	generated := aConnector generateTrigger: self.
	self hierarchyChangeManaged.
	^ generated
]

{ #category : #'as yet unclassified' }
TLShapeTrigger >> initialStyle: aStyleOrStyleSheetCustomizationBlock [
	aStyleOrStyleSheetCustomizationBlock isSymbol
		ifTrue: [ self addStyle: aStyleOrStyleSheetCustomizationBlock ] 
		ifFalse: [ self styleSheet dynamicCustomization: aStyleOrStyleSheetCustomizationBlock ]
]

{ #category : #initialization }
TLShapeTrigger >> initialize [
	super initialize.
	action:= (TLCustomAction block: [:aDrawable | self shapeInteraction actionOn: aDrawable])
]

{ #category : #interactions }
TLShapeTrigger >> onClick [
	self addInteraction: self action onClick
]

{ #category : #interactions }
TLShapeTrigger >> onDoubleClick [
	self addInteraction: self action onDoubleClick
]

{ #category : #accessing }
TLShapeTrigger >> parent [
	^ self shapeInteraction ifNotNil: [ self shapeInteraction container]
]

{ #category : #accessing }
TLShapeTrigger >> referencedElement [
	^ referencedElement
]

{ #category : #accessing }
TLShapeTrigger >> referencedElement: anObject [
	referencedElement := anObject
]

{ #category : #'as yet unclassified' }
TLShapeTrigger >> removeWith: aTLConnector [ 
	aTLConnector removeTrigger: self
]

{ #category : #'as yet unclassified' }
TLShapeTrigger >> secondStyle: aStyleOrStyleSheetCustomizationBlock [
	aStyleOrStyleSheetCustomizationBlock isSymbol
		ifTrue: [ secondStateStyle := aStyleOrStyleSheetCustomizationBlock ]
		ifFalse: [ aStyleOrStyleSheetCustomizationBlock value: self styleSheet > #second ]
]

{ #category : #accessing }
TLShapeTrigger >> shapeInteraction [
	^ shapeInteraction
]

{ #category : #accessing }
TLShapeTrigger >> shapeInteraction: anObject [
	shapeInteraction := anObject
]

{ #category : #generation }
TLShapeTrigger >> updateWith: aConnector [
	aConnector updateShapeTrigger: self
]

{ #category : #interactions }
TLShapeTrigger >> withMenu: aString [
	self addInteraction: (self action withMenu: aString)
]
