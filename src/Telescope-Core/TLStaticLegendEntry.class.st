"
I am the superclass for all static legend parametrized by user to describe width, height...
"
Class {
	#name : #TLStaticLegendEntry,
	#superclass : #TLLegendEntry,
	#instVars : [
		'label'
	],
	#category : #'Telescope-Core-Model-Legend'
}

{ #category : #'instance creation' }
TLStaticLegendEntry class >> description: aDescription [
	^ self new
		label: aDescription;
		yourself
]

{ #category : #testing }
TLStaticLegendEntry class >> isAbstract [
	^ self = TLStaticLegendEntry
]

{ #category : #testing }
TLStaticLegendEntry >> isStatic [
	^ true
]

{ #category : #accessing }
TLStaticLegendEntry >> label [
	^ label
]

{ #category : #accessing }
TLStaticLegendEntry >> label: anObject [
	label := anObject
]
