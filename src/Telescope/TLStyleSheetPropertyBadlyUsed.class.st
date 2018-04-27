"
I am an exception sent when a style property was not applicable to an entity (usually it would have send a MessageNotUnderstood)
"
Class {
	#name : #TLStyleSheetPropertyBadlyUsed,
	#superclass : #TLWrongUsedFunctionalityException,
	#instVars : [
		'property',
		'entity',
		'propertyBlock'
	],
	#category : 'Telescope-Exceptions'
}

{ #category : #signalling }
TLStyleSheetPropertyBadlyUsed class >> signalForProperty: aPropertyOrValuable propertyBlock: result entity: anEntity [
	^ self new
		property: aPropertyOrValuable;
		propertyBlock: result;
		entity: anEntity;
		signal
]

{ #category : #accessing }
TLStyleSheetPropertyBadlyUsed >> entity [
	^ entity
]

{ #category : #accessing }
TLStyleSheetPropertyBadlyUsed >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
TLStyleSheetPropertyBadlyUsed >> messageText [
	^ 'Telescope encountered an error when trying to apply: ' , self propertyBlock asString , ' on: '
		, self entity asString , ' to obtain: ' , self property asString
]

{ #category : #accessing }
TLStyleSheetPropertyBadlyUsed >> property [
	^ property
]

{ #category : #accessing }
TLStyleSheetPropertyBadlyUsed >> property: anObject [
	property := anObject
]

{ #category : #accessing }
TLStyleSheetPropertyBadlyUsed >> propertyBlock [
	^ propertyBlock
]

{ #category : #accessing }
TLStyleSheetPropertyBadlyUsed >> propertyBlock: anObject [
	propertyBlock := anObject
]
