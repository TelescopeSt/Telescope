"
I am an exception sent when a style property was not applicable to an entity (usually it would have send a MessageNotUnderstood)
"
Class {
	#name : #TLStyleSheetPropertyBadlyUsed,
	#superclass : #TLWrongUsedFunctionalityException,
	#instVars : [
		'property',
		'propertyBlock'
	],
	#category : #'Telescope-Core-Exceptions'
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
