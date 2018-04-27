"
I am an action that execute the provided block as a seaside callback
"
Class {
	#name : #TLSeasideCallBackAction,
	#superclass : #TLDrawableAction,
	#instVars : [
		'block',
		'openInNewTab'
	],
	#category : 'Telescope-Cytoscape-Actions'
}

{ #category : #'instance-creation' }
TLSeasideCallBackAction class >> block: aBlockClosure [
	^ self new
		block: aBlockClosure;
		yourself
]

{ #category : #'instance-creation' }
TLSeasideCallBackAction class >> block: aBlockClosure condition: aBlock2 [
	^ (self block: aBlockClosure)
		condition: aBlock2;
		yourself
]

{ #category : #'instance-creation' }
TLSeasideCallBackAction class >> inNewTabWithBlock: aBlockClosure [
	^ self new
		block: aBlockClosure;
		openInNewTab: true;
		yourself
]

{ #category : #action }
TLSeasideCallBackAction >> actionOn: aTLDrawable [
	aTLDrawable generator executeCallBack: self block onDrawable: aTLDrawable newTab: self openInNewTab
]

{ #category : #accessing }
TLSeasideCallBackAction >> block [
	^ block
]

{ #category : #accessing }
TLSeasideCallBackAction >> block: anObject [
	block := anObject
]

{ #category : #'as yet unclassified' }
TLSeasideCallBackAction >> initialize [
	super initialize.
	self openInNewTab: false
]

{ #category : #accessing }
TLSeasideCallBackAction >> openInNewTab [
	^ openInNewTab
]

{ #category : #accessing }
TLSeasideCallBackAction >> openInNewTab: anObject [
	openInNewTab := anObject
]
