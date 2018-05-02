"
I am a simulator that execute the layouting and only keep occupied dimension
"
Class {
	#name : #TLLinearLayoutSimulator,
	#superclass : #TLLinearLayout,
	#instVars : [
		'totalDimension'
	],
	#category : 'Telescope-Layouts'
}

{ #category : #accessing }
TLLinearLayoutSimulator >> initialize [
	super initialize.
	self totalDimension: 0@0
]

{ #category : #'as yet unclassified' }
TLLinearLayoutSimulator >> on: aGroup [
	"This error is signaled because if this method is called with ratio strategy; it will cause infinite loop"
	self error: 'Not designed to be executed'
]

{ #category : #placing }
TLLinearLayoutSimulator >> placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight [
	self flag: #TODO.	"We have an approximation because we are using the position of the last node and not the position of the node with the boggest height "
	lineOfNodesWithPosition values last
		in: [ :nodeWithPosition | totalDimension := totalDimension max: nodeWithPosition key + ((nodeWithPosition value / 2) @ (maxHeight / 2)) ]
]

{ #category : #ratio }
TLLinearLayoutSimulator >> ratio [
	^ self totalDimension x / self totalDimension y
]

{ #category : #accessing }
TLLinearLayoutSimulator >> totalDimension [
	^ totalDimension
]

{ #category : #accessing }
TLLinearLayoutSimulator >> totalDimension: anObject [
	totalDimension := anObject
]
