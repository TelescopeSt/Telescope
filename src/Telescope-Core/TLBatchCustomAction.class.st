Class {
	#name : #TLBatchCustomAction,
	#superclass : #Object,
	#instVars : [
		'block',
		'drawablesGetter',
		'aVisualization'
	],
	#category : #'Telescope-Core-Utils'
}

{ #category : #'instance creation' }
TLBatchCustomAction class >> on: aNodesGetterBlock block: aComputeBlock [
	^ self new
		block: aComputeBlock;
		drawablesGetter: aNodesGetterBlock;
		yourself
]

{ #category : #accessing }
TLBatchCustomAction >> actionOn: aTLDrawable [
	| drawables highlightStyle generator |
	generator := aTLDrawable visualization generator.
	drawables := self drawablesGetter cull: aTLDrawable.
	highlightStyle := TLStyleCustomizationAction
		custom: [ :style | 
			style
				borderColor: Color red lighter;
				color: Color red lighter ].
	drawables
		do: [ :eachDrawable | highlightStyle regularActionOn: eachDrawable ].
	generator removeAllCommands.
	drawables
		do: [ :eachDrawable | 
			self block cull: eachDrawable.
			highlightStyle reverseActionOn: eachDrawable.
			generator removeAllCommands ]
]

{ #category : #accessing }
TLBatchCustomAction >> block [
	^ block
]

{ #category : #accessing }
TLBatchCustomAction >> block: anObject [
	block := anObject
]

{ #category : #accessing }
TLBatchCustomAction >> drawablesGetter [
	^ drawablesGetter
]

{ #category : #accessing }
TLBatchCustomAction >> drawablesGetter: anObject [
	drawablesGetter := anObject
]
