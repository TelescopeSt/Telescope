Class {
	#name : #TLDrawableTest,
	#superclass : #TestCase,
	#instVars : [
		'drawable'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLDrawableTest >> setUp [
	super setUp.
	drawable := TLDrawable new
]

{ #category : #tests }
TLDrawableTest >> testAddStyleRequireUpdate [
	self deny: drawable isUpdateRequired.
	drawable addStyle: #style.
	self assert: drawable isUpdateRequired
]

{ #category : #tests }
TLDrawableTest >> testremoveNonExistingStyleDoesNotRequireUpdate [
	self deny: drawable isUpdateRequired.
	drawable removeStyle: #style.
	self deny: drawable isUpdateRequired
]

{ #category : #tests }
TLDrawableTest >> testremoveStyleRequireUpdateIfPresent [
	self deny: drawable isUpdateRequired.
	drawable addStyle: #style.
	drawable isUpdateRequired: false.
	drawable removeStyle: #style.
	self assert: drawable isUpdateRequired
]
