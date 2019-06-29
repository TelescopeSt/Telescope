"
a TLInteraction is the superclass for every interactions. It contains a TLAction that will be executed on trigger.
"
Class {
	#name : #TLInteraction,
	#superclass : #TLObject,
	#instVars : [
		'action',
		'container',
		'inherited'
	],
	#category : #'Telescope-Core-Interactions'
}

{ #category : #accessing }
TLInteraction >> action [
	^ action
]

{ #category : #accessing }
TLInteraction >> action: aTLAction [
	action := aTLAction
]

{ #category : #action }
TLInteraction >> actionOn: something [
	self action actionOn: something
]

{ #category : #accessing }
TLInteraction >> condition [
	^ self action condition
]

{ #category : #accessing }
TLInteraction >> condition: anObject [
	self action condition: anObject
]

{ #category : #accessor }
TLInteraction >> container [
	^ container
]

{ #category : #accessor }
TLInteraction >> container: aTLDrawable [ 
	container:= aTLDrawable
]

{ #category : #generate }
TLInteraction >> generateWith: aTLConnector on: aTLDrawable targeting: anObject [
	self subclassResponsibility 
]

{ #category : #accessing }
TLInteraction >> inherited [
	^ inherited
]

{ #category : #accessing }
TLInteraction >> inherited: anObject [
	inherited := anObject
]

{ #category : #initialization }
TLInteraction >> initialize [
	super initialize.
	self inherited: false
]

{ #category : #testing }
TLInteraction >> isDrop [
	^ false
]

{ #category : #testing }
TLInteraction >> isGraphicallyRepresented [
	^ false
]

{ #category : #testing }
TLInteraction >> isMenu [
	^ false
]

{ #category : #testing }
TLInteraction >> isMouseOver [
	^ false
]

{ #category : #private }
TLInteraction >> kind [
	^ self subclassResponsibility 
]

{ #category : #children }
TLInteraction >> propagateToChildren [
	"This method allow children nodes of composite to inherit interactions from their parent"
	self inherited: true
]

{ #category : #action }
TLInteraction >> regularActionIfNecessaryOn: aTLSimpleNode [ 
	self action regularActionIfNecessaryOn: aTLSimpleNode .
]

{ #category : #generation }
TLInteraction >> removeWith: aConnector [ 
]

{ #category : #removing }
TLInteraction >> removeWith: aTLConnectorTest forDrawable: aDrawable [ 
	self removeWith: aTLConnectorTest
]

{ #category : #action }
TLInteraction >> reverseActionOn: something [
	self action reverseActionOn: something
]

{ #category : #private }
TLInteraction >> reverseKind [
	^ self kind
]

{ #category : #testing }
TLInteraction >> shouldOccursOn: aKindOfInteraction [ 
	^ self kind = aKindOfInteraction and: [ self condition isNotNil  ]
]

{ #category : #testing }
TLInteraction >> shouldOccursOn: aKindOfInteraction with: aDrawable [
	^ self kind = aKindOfInteraction and: [ self condition value: aDrawable ]
]
