"
Description
-------------------

A TLStyleCustomizationAction is an action that change the style of  drawables. This action can be reverted. 

I can be parametrized to chose my targets and the style to change. 

Public API and Key Messages
-------------------
- #customizationBlock: aBlock 		I should have a block taking as parameter the style of a drawable and  changing his style.
- #target: aBlock 					I should also have a block taking as parameter the drawable receiving the interaction and returning the collection of drawables to change.

Example 
--------------------
 
	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet nodeLabel: #asString.
	visualization 
		addNodesFromEntities: (1 to: 10);
		addInteraction: (TLStyleCustomizationAction custom: [:style | style backgroundColor: Color red]) onMouseOver.
	^ visualization
	
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	customizationBlock:			<aBlock> 		I am a block taking as parameter the style of an element and modifying it.
	previousStyleDictionary:		<aDictionary>	I am an internal mechanisme to save which drawables received an interaction and which drawables where impacted.
	target:						<aBlock>		I am a block taking as parameter the drawable receiving the interaction and returning the drawables to customize.

"
Class {
	#name : #TLStyleCustomizationAction,
	#superclass : #TLReversibleNodeAction,
	#instVars : [
		'previousStyleDictionary',
		'customizationBlock',
		'target'
	],
	#category : #'Telescope-Core-Actions'
}

{ #category : #'instance creation' }
TLStyleCustomizationAction class >> custom: aBlock [
	^ self new customizationBlock: aBlock; yourself
]

{ #category : #'instance creation' }
TLStyleCustomizationAction class >> custom: aBlock target: aTargetDrawable [
	^ self new customizationBlock: aBlock; target: aTargetDrawable; yourself
]

{ #category : #accessing }
TLStyleCustomizationAction >> customizationBlock [
	^ customizationBlock
]

{ #category : #accessing }
TLStyleCustomizationAction >> customizationBlock: anObject [
	customizationBlock := anObject
]

{ #category : #action }
TLStyleCustomizationAction >> customize: aDrawable [
	aDrawable state at: self stateKey put: aDrawable styleSheet copy.
	self customizationBlock cull: aDrawable styleSheet cull: aDrawable.
	aDrawable requireUpdate
]

{ #category : #initialization }
TLStyleCustomizationAction >> initialize [
	super initialize.
	self previousStyleDictionary: Dictionary new
]

{ #category : #private }
TLStyleCustomizationAction >> obtainTargetDrawablesFrom: aTLDrawable [
	^ (self target ifNotNil: [ :t | t value: aTLDrawable ] ifNil: [ aTLDrawable ]) asOrderedCollection
]

{ #category : #accessing }
TLStyleCustomizationAction >> previousStyleDictionary [
	^ previousStyleDictionary
]

{ #category : #accessing }
TLStyleCustomizationAction >> previousStyleDictionary: anObject [
	previousStyleDictionary := anObject
]

{ #category : #action }
TLStyleCustomizationAction >> regularActionOn: aDrawable [
	(self previousStyleDictionary at: aDrawable put: (self obtainTargetDrawablesFrom: aDrawable))
		do: [ :aTargetDrawable | self customize: aTargetDrawable ]
]

{ #category : #action }
TLStyleCustomizationAction >> removeCustomization: aDrawable [
	[ 
		aDrawable styleSheet: (aDrawable state removeKey: self stateKey).
		aDrawable requireUpdate.
	
		"In case we have a composite node that opened, we also need to refresh its children."
		(aDrawable isCompositeNode and: [ aDrawable hasChildrenToDisplay ]) ifTrue: [ aDrawable childrenNodes do: #requireUpdate ]
	 ]
		on: KeyNotFound
		do: [ self flag: 'Trying to remove a customization that I do not have in my style dict' ]
]

{ #category : #action }
TLStyleCustomizationAction >> reverseActionOn: aTLDrawable [
	(self previousStyleDictionary removeKey: aTLDrawable)
		do: [ :aTargetDrawable | self removeCustomization: aTargetDrawable ]
]

{ #category : #testing }
TLStyleCustomizationAction >> shouldTriggerReverseActionFor: aTLDrawable [
	^ self previousStyleDictionary at: aTLDrawable ifPresent: [ :c | true ] ifAbsent: [ false ]
]

{ #category : #action }
TLStyleCustomizationAction >> stateKey [
	self flag: #danger.	"Maybe this is not unique enought because we can have the same block for many interactions."
	^ #styleCustomized , self customizationBlock hash asString
]

{ #category : #accessing }
TLStyleCustomizationAction >> target [
	^ target
]

{ #category : #accessing }
TLStyleCustomizationAction >> target: anObject [
	target := anObject
]
