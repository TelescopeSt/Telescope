Class {
	#name : #TLDrawableTests,
	#superclass : #TestCase,
	#instVars : [
		'tlObject',
		'drawable'
	],
	#category : 'Telescope-Tests-Model'
}

{ #category : #running }
TLDrawableTests >> setUp [
	drawable := TLDrawable new
]

{ #category : #tests }
TLDrawableTests >> testAddStyleRequireUpdate [
	self deny: drawable isUpdateRequired.
	drawable addStyle: #style.
	self assert: drawable isUpdateRequired
]

{ #category : #tests }
TLDrawableTests >> testremoveNonExistingStyleDoesNotRequireUpdate [
	self deny: drawable isUpdateRequired.
	drawable removeStyle: #style.
	self deny: drawable isUpdateRequired
]

{ #category : #tests }
TLDrawableTests >> testremoveStyleRequireUpdateIfPresent [
	self deny: drawable isUpdateRequired.
	drawable addStyle: #style.
	drawable isUpdateRequired: false.
	drawable removeStyle: #style.
	self assert: drawable isUpdateRequired
]
