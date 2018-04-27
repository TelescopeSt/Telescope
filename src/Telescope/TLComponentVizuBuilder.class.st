"
The purpose of the component builder is to show containers and their children arranged inside with a vertical layout. This can be useful to show, for example, packages and their classes inside. Each package, in this case, is collapsable. The interactions are not show (yet).
"
Class {
	#name : #TLComponentVizuBuilder,
	#superclass : #TLVisualization,
	#instVars : [
		'componentsToDisplay'
	],
	#category : 'Telescope-Visualizations'
}

{ #category : #building }
TLComponentVizuBuilder >> buildVisualization [
	self nodeCreationStrategy beRecursive.
	self componentsToDisplay do: [ :acomp | self addNodeFromEntity: acomp].
	self doLayout.
	super buildVisualization
]

{ #category : #accessing }
TLComponentVizuBuilder >> componentsToDisplay [
	^ componentsToDisplay
]

{ #category : #accessing }
TLComponentVizuBuilder >> componentsToDisplay: anObject [
	componentsToDisplay := anObject
]

{ #category : #accessing }
TLComponentVizuBuilder >> doLayout [
	self layout: (TLLinearLayout gap: 20 perLine: 3)
]
