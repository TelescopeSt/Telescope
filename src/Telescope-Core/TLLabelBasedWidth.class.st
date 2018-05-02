"
Description
--------------------

This class takes care of computing the node width from its label size. In case there is no label the user can specify a default value to use.

If a node has no label and the default value is not set, I will raise an error to the user.

Example
--------------------

	| visu |
	visu := TLVisualization new.
	visu styleSheet
		nodeLabel: #asString;
		adaptNodeWidthFromLabelWithDefault: 20.
	visu addNodesFromEntities: ((0 to: 26) collect: [ :number | Character alphabet first: number ]).
	^ visu
 
Internal Representation and Key Implementation Points.
-------------------

    Instance Variables
	defaultWidth:		<anInteger> The default width of a node without label

"
Class {
	#name : #TLLabelBasedWidth,
	#superclass : #TLObject,
	#instVars : [
		'defaultWidth'
	],
	#category : #'Telescope-Core-Style'
}

{ #category : #'instance creation' }
TLLabelBasedWidth class >> defaultWidth: anInteger [
	^ self new
		defaultWidth: anInteger;
		yourself
]

{ #category : #evaluating }
TLLabelBasedWidth >> cull: anEntity cull: aNode [
	| stringLabel |
	stringLabel := aNode effectiveStyleSheet obtainValue: #nodeLabel forEntity: anEntity inNode: aNode.
	^ stringLabel isEmptyOrNil
		ifFalse: [ | labelSize |
			labelSize := aNode effectiveStyleSheet obtainValue: #labelSize forEntity: anEntity inNode: aNode.
			(2 + (stringLabel size * 10)) / (TLStyleSheet defaultLabelSize / labelSize) ]
		ifTrue: [ self defaultWidth ifNil: [ TLStyleSheetLabelBasedWidthBadlyUsed signalForEntity: anEntity ] ]
]

{ #category : #accessing }
TLLabelBasedWidth >> defaultWidth [
	^ defaultWidth
]

{ #category : #accessing }
TLLabelBasedWidth >> defaultWidth: anObject [
	defaultWidth := anObject
]

{ #category : #testing }
TLLabelBasedWidth >> isEvaluable [
	^ true
]
