"
I am a basic object used in demo to create a demo graph.

NOT SUPPOSED TO BE USED
"
Class {
	#name : #TLBasicBlock,
	#superclass : #TLObject,
	#instVars : [
		'pred',
		'next',
		'title'
	],
	#category : 'Telescope-Demos'
}

{ #category : #'instance creation' }
TLBasicBlock class >> title: aString [
	^ self new
		title: aString;
		yourself
]

{ #category : #'as yet unclassified' }
TLBasicBlock >> = aBlock [
	^ self title = aBlock title
]

{ #category : #accessing }
TLBasicBlock >> next [
	next ifNil: [ self next: OrderedCollection new ].
	^ next
]

{ #category : #accessing }
TLBasicBlock >> next: anObject [
	next := anObject
]

{ #category : #accessing }
TLBasicBlock >> pred [
	pred ifNil: [ self pred: OrderedCollection new ].
	^ pred
]

{ #category : #accessing }
TLBasicBlock >> pred: anObject [
	pred := anObject
]

{ #category : #'as yet unclassified' }
TLBasicBlock >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' ('.
	self title printOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #accessing }
TLBasicBlock >> title [
	^ title
]

{ #category : #accessing }
TLBasicBlock >> title: anObject [
	title := anObject
]
