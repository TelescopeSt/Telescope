"
I represent a gradient of colors. I will concern a set of entities that telescope
"
Class {
	#name : #TLGradient,
	#superclass : #TLObject,
	#instVars : [
		'levelForColors',
		'levelProperty'
	],
	#category : #'Telescope-Core-Style'
}

{ #category : #compute }
TLGradient >> computeForLevel: aLevel [
	| min max |
	min := self levelForColors reverse detect: [ :levelWithColor | levelWithColor key <= aLevel ] ifNone: [ nil ].
	max := self levelForColors detect: [ :levelWithColor | levelWithColor key >= aLevel ] ifNone: [ nil ].
	min ifNil: [ ^ max value ].
	max ifNil: [ ^ min value ].
	min = max ifTrue: [ ^ min value ].
	^ max value alphaMixed: (aLevel - min key) / (max key - min key) with: min value
]

{ #category : #'as yet unclassified' }
TLGradient >> cull: anEntity cull: aNode [
	^ self computeForLevel: (self levelProperty cull: anEntity cull: aNode ) 
]

{ #category : #initialization }
TLGradient >> initialize [
	super initialize.
	self levelForColors: SortedCollection new
]

{ #category : #'as yet unclassified' }
TLGradient >> isEvaluable [
	^ true
]

{ #category : #accessing }
TLGradient >> levelForColors [
	^ levelForColors
]

{ #category : #accessing }
TLGradient >> levelForColors: anObject [
	levelForColors := anObject
]

{ #category : #accessing }
TLGradient >> levelProperty [
	^ levelProperty
]

{ #category : #accessing }
TLGradient >> levelProperty: anObject [
	levelProperty := anObject
]

{ #category : #'as yet unclassified' }
TLGradient >> percentageForLevel: aLevel [
	| low high |
	low := self levelForColors first key.
	high := self levelForColors last key.
	^ (aLevel - low) / (high - low)
]

{ #category : #'as yet unclassified' }
TLGradient >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(;
		<< self levelProperty;
		<< $)
]

{ #category : #accessing }
TLGradient >> to: aColor at: aLevel [
	self levelForColors add: (aLevel -> aColor)
]

{ #category : #accessing }
TLGradient >> value: anEntity [
	^ self computeForLevel: (self levelProperty value: anEntity)
]
