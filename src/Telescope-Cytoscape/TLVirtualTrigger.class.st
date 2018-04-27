Class {
	#name : #TLVirtualTrigger,
	#superclass : #TLVirtualNode,
	#traits : 'TVirtualElement',
	#classTraits : 'TVirtualElement classTrait',
	#instVars : [
		'triggerPosition',
		'virtualNodeReference'
	],
	#category : 'Telescope-Cytoscape-Virtual'
}

{ #category : #position }
TLVirtualTrigger >> cytoscapePosition [
	^ self position
]

{ #category : #position }
TLVirtualTrigger >> position [
	^ self triggerPosition computePositionOf: self relativeTo: self virtualNodeReference
]

{ #category : #accessing }
TLVirtualTrigger >> triggerPosition [
	^ triggerPosition
]

{ #category : #accessing }
TLVirtualTrigger >> triggerPosition: aTLposition [
	triggerPosition:= aTLposition
]

{ #category : #accessing }
TLVirtualTrigger >> virtualNodeReference [
	^ virtualNodeReference
]

{ #category : #accessing }
TLVirtualTrigger >> virtualNodeReference: aTLvirtualNode [
	virtualNodeReference := aTLvirtualNode
]
