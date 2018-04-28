"
I am an exception raised when we try to determine the width of a node from his label when the label is not set.
"
Class {
	#name : #TLStyleSheetLabelBasedWidthBadlyUsed,
	#superclass : #TLWrongUsedFunctionalityException,
	#instVars : [
		'entity'
	],
	#category : #'Telescope-Core-Exceptions'
}

{ #category : #signalling }
TLStyleSheetLabelBasedWidthBadlyUsed class >> signalForEntity: anEntity [
	self new
		entity: anEntity;
		signal
]

{ #category : #accessing }
TLStyleSheetLabelBasedWidthBadlyUsed >> entity [
	^ entity
]

{ #category : #accessing }
TLStyleSheetLabelBasedWidthBadlyUsed >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
TLStyleSheetLabelBasedWidthBadlyUsed >> messageText [
	^ 'Your tried to adapt the width of a node to his label size but this node has no label. If you want to use a default value in that case use #adaptNodeWidthFromLabelWithDefault: instead of adaptNodeWidthFromLabel. Concerned entity: '
		, self entity asString
]
