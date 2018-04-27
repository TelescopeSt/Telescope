"
I am a really simple visualization that show the model of another visualization as a tree
"
Class {
	#name : #TLDebuggingVisualizationTreeViewer,
	#superclass : #TLVisualization,
	#instVars : [
		'anotherVisualization'
	],
	#category : 'Telescope-Debugging'
}

{ #category : #'instance-creation' }
TLDebuggingVisualizationTreeViewer class >> visu: anotherVisu [
	^ self new
		anotherVisualization: anotherVisu;
		yourself
]

{ #category : #accessing }
TLDebuggingVisualizationTreeViewer >> anotherVisualization [
	^ anotherVisualization
]

{ #category : #accessing }
TLDebuggingVisualizationTreeViewer >> anotherVisualization: anObject [
	anotherVisualization := anObject
]

{ #category : #building }
TLDebuggingVisualizationTreeViewer >> buildVisualization [
	self displayVisu
]

{ #category : #building }
TLDebuggingVisualizationTreeViewer >> displayVisu [
	(self addNodeFromEntity: anotherVisualization) styleSheet
		nodeLabel: 'Visualization';
		backgroundColor: MDLColor deepOrange.
	(self addNodesFromEntities: anotherVisualization obtain recursively nodes)
		do: [ :aNode | 
			aNode
				addStyle:
					(aNode entity isComposite
						ifTrue: [ #compositeNode ]
						ifFalse: [ #simpleNode ]) ].
	self styleSheet > #parentRelation color: MDLColor blue.
	self styleSheet > #compositeParentRelation color: MDLColor green.
	(self connectFollowingProperty: #parent) addStyle: #parentRelation.
	(self connectFollowingProperty: #parentNode) addStyle: #compositeParentRelation.
	self layout: TLTreeLayout new.
	self styleSheet nodeLabel: [ :node | node entity asString ].
	self styleSheet > #simpleNode backgroundColor: MDLColor yellow.
	self styleSheet > #compositeNode backgroundColor: MDLColor orange.
	self legend backgroundDescription: [ :node | node class asString ]
]

{ #category : #building }
TLDebuggingVisualizationTreeViewer >> update [
	self removeAll.
	self legend: (TLLegend parent: self).
	self displayVisu.
	super update
]
