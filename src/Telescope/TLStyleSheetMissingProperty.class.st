"
I am an exception sent when is required a property absent in the stylesheet
"
Class {
	#name : #TLStyleSheetMissingProperty,
	#superclass : #TLWrongUsedFunctionalityException,
	#instVars : [
		'property',
		'entity'
	],
	#category : 'Telescope-Exceptions'
}

{ #category : #accessing }
TLStyleSheetMissingProperty >> entity [
	^ entity
]

{ #category : #accessing }
TLStyleSheetMissingProperty >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
TLStyleSheetMissingProperty >> messageText [
	^ 'Telescope encountered an error because the property : ' , self property asString , ' is missing for entity: '
		, self entity asString
]

{ #category : #accessing }
TLStyleSheetMissingProperty >> property [
	^ property
]

{ #category : #accessing }
TLStyleSheetMissingProperty >> property: anObject [
	property := anObject
]
