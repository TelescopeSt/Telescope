"
A TLExpandCollapseCompositeNodeAction is an action to expand/collapse composites.

"
Class {
	#name : #TLExpandCollapseCompositeNodeAction,
	#superclass : #TLReversibleNodeAction,
	#category : #'Telescope-Core-Actions'
}

{ #category : #'instance creation' }
TLExpandCollapseCompositeNodeAction class >> onCompositeNodeWithChildren [
	^ self condition: [ :drawable | drawable isNode and: [ drawable isComposite and: [ drawable hasChildren ] ] ]
]

{ #category : #initialization }
TLExpandCollapseCompositeNodeAction >> initialize [
	super initialize.
	self condition: #isCompositeNode
]

{ #category : #action }
TLExpandCollapseCompositeNodeAction >> regularActionOn: aNode [
	aNode expanded: true
]

{ #category : #action }
TLExpandCollapseCompositeNodeAction >> reverseActionOn: aNode [
	aNode expanded: false
]

{ #category : #testing }
TLExpandCollapseCompositeNodeAction >> shouldTriggerReverseActionFor: aNode [
	^ aNode expanded
]
