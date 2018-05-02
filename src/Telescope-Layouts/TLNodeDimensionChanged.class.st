"
I am a notification that a node dimension has changed. I will be catched by the connector that will apply changes. This is designed because a layout is not supposed to change the dimension of a node but the option occupyMaxSpace changed it.
"
Class {
	#name : #TLNodeDimensionChanged,
	#superclass : #Notification,
	#instVars : [
		'node'
	],
	#category : 'Telescope-Layouts-Notifications'
}

{ #category : #signalling }
TLNodeDimensionChanged class >> signalForNode: aTLVirtualNode [
	self new
		node: aTLVirtualNode;
		signal
]

{ #category : #accessing }
TLNodeDimensionChanged >> node [
	^ node
]

{ #category : #accessing }
TLNodeDimensionChanged >> node: anObject [
	node := anObject
]
