"
I represent a virtual connection used to compute layout
"
Class {
	#name : #TLVirtualConnection,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : 'Telescope-Cytoscape-Virtual'
}

{ #category : #accessing }
TLVirtualConnection >> from [
	^ from
]

{ #category : #accessing }
TLVirtualConnection >> from: anObject [
	from := anObject
]

{ #category : #'as yet unclassified' }
TLVirtualConnection >> isUsedInLayout [
	^ true
]

{ #category : #accessing }
TLVirtualConnection >> to [
	^ to
]

{ #category : #accessing }
TLVirtualConnection >> to: anObject [
	to := anObject
]
