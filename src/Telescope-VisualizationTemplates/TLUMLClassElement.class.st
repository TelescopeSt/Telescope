"
A TLUMLClassElement is a representation for an element of a class diagram. Currently, it is a work in progress.

Instance Variables
	entity:		<Object>
	titleToProperty:		<Object>

entity
	- xxxxx

titleToProperty
	- xxxxx

"
Class {
	#name : #TLUMLClassElement,
	#superclass : #TLVisualization,
	#instVars : [
		'entity',
		'attributesBlock',
		'methodsBlock'
	],
	#category : #'Telescope-VisualizationTemplates'
}

{ #category : #accessing }
TLUMLClassElement >> attributesBlock [
	^ attributesBlock
]

{ #category : #accessing }
TLUMLClassElement >> attributesBlock: anObject [
	attributesBlock := anObject
]

{ #category : #building }
TLUMLClassElement >> buildVisualization [
	"general layout for class and its elements"

	(self
		childrenProperty: [ :aClass | 
			{aClass.
			aClass} ]) childrenProperty: #yourself.
	self styleSheet
		childrenLayout: (TLLinearLayout topToBottom gap: 0);
		compositeExpandedByDefault: true;
		backgroundColor: Color white;
		borderColor: Color black;
		nodeLabel: #asString position: #inside.	"for variables and methods groups"
	(self styleSheet > #children)
		borderColor: Color white;
		noNodeLabel.	"for variables and methods separately"
	(self styleSheet > #children > #children)
		nodeLabel: #asString;
		onlyLabelForNodes.
	self > #default addNodeFromEntity: self entity.
	self > #default
		nodesDo: [ :aClassNode | 
			aClassNode childrenNodes first childrenProperty: self attributesBlock.
			aClassNode childrenNodes second childrenProperty: self methodsBlock ]
]

{ #category : #accessing }
TLUMLClassElement >> entity [
	^ entity
]

{ #category : #accessing }
TLUMLClassElement >> entity: anObject [
	entity := anObject
]

{ #category : #initialization }
TLUMLClassElement >> initialize [
	super initialize.
	titleToProperty := Dictionary new.
]

{ #category : #accessing }
TLUMLClassElement >> methodsBlock [
	^ methodsBlock
]

{ #category : #accessing }
TLUMLClassElement >> methodsBlock: anObject [
	methodsBlock := anObject
]
