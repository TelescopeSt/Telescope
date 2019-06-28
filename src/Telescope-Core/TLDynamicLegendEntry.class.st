"
I am the superclass for all dynamic legend entries, computed on a set of elements and updated automatically
"
Class {
	#name : #TLDynamicLegendEntry,
	#superclass : #TLLegendEntry,
	#instVars : [
		'contextBlock',
		'descriptionBlock'
	],
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #'instance creation' }
TLDynamicLegendEntry class >> description: descriptionBlock context: contextBlock [
	^ self new
		descriptionBlock: descriptionBlock;
		contextBlock: contextBlock;
		yourself
]

{ #category : #testing }
TLDynamicLegendEntry class >> isAbstract [
	^ self = TLDynamicLegendEntry
]

{ #category : #accessing }
TLDynamicLegendEntry >> contextBlock [
	^ contextBlock
]

{ #category : #accessing }
TLDynamicLegendEntry >> contextBlock: anObject [
	contextBlock := anObject
]

{ #category : #accessing }
TLDynamicLegendEntry >> descriptionBlock [
	^ descriptionBlock
]

{ #category : #accessing }
TLDynamicLegendEntry >> descriptionBlock: anObject [
	descriptionBlock := anObject
]

{ #category : #resolution }
TLDynamicLegendEntry >> obtainAssociations [
	^ (self contextBlock value groupedBy: [ :drawable | self descriptionBlock value: drawable entity ]) sorted: [ :a :b | a < b ]
]
