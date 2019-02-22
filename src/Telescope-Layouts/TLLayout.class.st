"
I am the superclass for all layouts in Telescope. A layout is able to display drawables (nodes and groups) following its own logic and parameters.
"
Class {
	#name : #TLLayout,
	#superclass : #Object,
	#instVars : [
		'angle',
		'cache'
	],
	#category : #'Telescope-Layouts-Core'
}

{ #category : #'instance creation' }
TLLayout class >> angle: anAngle [
	"The angle to rotate the layout in degree CCW. 
	
	0 is a vector from left to right
	90 is from top to bottom
	180 is a vector from right to left
	270 is bottom to top
	"
	
	^ self new
		angle: anAngle;
		yourself
]

{ #category : #'instance creation' }
TLLayout class >> bottomToTop [
	^ self new bottomToTop
]

{ #category : #testing }
TLLayout class >> isConnectionDependant [
	"For some optimisation we might want to know if our current layout depend on connections between nodes or not. For example the tree layout depend on connections between nodes but the linear layout doesn't depend on them. Thus my subclasses using connections in the layout should override this method."

	^ false
]

{ #category : #'instance creation' }
TLLayout class >> leftToRight [
	^ self new leftToRight
]

{ #category : #'instance creation' }
TLLayout class >> on: aGroup [ 
	^ self new on: aGroup 
]

{ #category : #'instance creation' }
TLLayout class >> rightToLeft [
	^ self new rightToLeft
]

{ #category : #'instance creation' }
TLLayout class >> topToBottom [
	^ self new topToBottom
]

{ #category : #accessing }
TLLayout >> angle [
	"The angle to rotate the layout in degree CCW. 
	
	0 is a vector from left to right
	90 is from top to bottom
	180 is a vector from right to left
	270 is bottom to top
	"
	
	^ angle
]

{ #category : #accessing }
TLLayout >> angle: anObject [
	"The angle to rotate the layout in degree CCW. 
	
	0 is a vector from left to right
	90 is from top to bottom
	180 is a vector from right to left
	270 is bottom to top
	"
	
	angle := anObject
]

{ #category : #'as yet unclassified' }
TLLayout >> angleInRadians: anAngleInDegrees [
	^ anAngleInDegrees degreesToRadians negated
]

{ #category : #angle }
TLLayout >> bottomToTop [
	self angle: 270
]

{ #category : #accessing }
TLLayout >> cache [
	^ cache
]

{ #category : #accessing }
TLLayout >> cache: anObject [
	cache := anObject
]

{ #category : #'as yet unclassified' }
TLLayout >> changeNode: aNode dimension: aNewDimension [
	aNode dimension: (self obtainsDimension: aNewDimension forAngle: self angle negated)
]

{ #category : #placing }
TLLayout >> clearCache [
	cache := Dictionary new
]

{ #category : #'node facade' }
TLLayout >> definePosition: aPosition forNode: aNode [
	"Layouts are always working in an ideal reference, then we place the node with the desired rotation"

	self cache at: aNode put: aPosition
]

{ #category : #placing }
TLLayout >> executeOn: aGroup [
	"It is the main method of a layout and will define group elements positions"
	self subclassResponsibility 
]

{ #category : #initialization }
TLLayout >> initialize [
	super initialize.
	self angle: 0.
	self clearCache
]

{ #category : #testing }
TLLayout >> isConnectionDependant [
	^ self class isConnectionDependant
]

{ #category : #angle }
TLLayout >> leftToRight [
	self angle: 0
]

{ #category : #'as yet unclassified' }
TLLayout >> obtainsDimension: nodeDimension forAngle: anAngleInDegree [
	"Here we have optimisation to avoid creating Rectangles if result is easy to determine"

	^ anAngleInDegree \\ 180 = 0
		ifTrue: [ nodeDimension ]
		ifFalse: [ 
			anAngleInDegree \\ 180 = 90
				ifTrue: [ nodeDimension y @ nodeDimension x ]
				ifFalse: [ 
					| rotatedPoints angleInRadians |
					angleInRadians := self angleInRadians: anAngleInDegree.
					rotatedPoints := {(0 @ nodeDimension y).
					(nodeDimension x @ 0).
					nodeDimension} collect: [ :point | point rotateBy: angleInRadians negated about: 0 @ 0 ].
					((rotatedPoints inject: 0 into: [ :value :point | point x max: value ])
						- (rotatedPoints inject: 0 into: [ :value :point | point x min: value ]))
						@
							((rotatedPoints inject: 0 into: [ :value :point | point y max: value ])
								- (rotatedPoints inject: 0 into: [ :value :point | point y min: value ])) ] ]
]

{ #category : #'as yet unclassified' }
TLLayout >> obtainsNodeDimension: aNode [
	aNode isNode
		ifTrue: [ aNode children size > 0
				ifTrue: [ ^ self obtainsNodeDimension: aNode forAngle: 0 ] ].
	^ self obtainsNodeDimension: aNode forAngle: self angle
]

{ #category : #'as yet unclassified' }
TLLayout >> obtainsNodeDimension: aNode forAngle: anAngleInDegree [
	^ self obtainsDimension: aNode dimension forAngle: anAngleInDegree
]

{ #category : #placing }
TLLayout >> on: aGroup [
	"It is the main method of a layout and will define group elements positions"
	| result |
	self clearCache.
	self restoreNodes: aGroup.
	self prepareFor: aGroup.
	self executeOn: aGroup.
	result := self rotateResult: self cache.
	self translateInPositiveReferencial: result
]

{ #category : #placing }
TLLayout >> prepareFor: aGroup [
	"It is a hook for layouts needing to prepare themselves before placing nodes"

	
]

{ #category : #placing }
TLLayout >> restoreNodes: aGroup [
	aGroup
		do: [ :aNode | 
			aNode occupyMaxSpace
				ifTrue: [ aNode restoreOriginalDimension ] ]
]

{ #category : #angle }
TLLayout >> rightToLeft [
	self angle: 180
]

{ #category : #placing }
TLLayout >> rotatePoint: aPosition [
	^ self angle = 0
		ifTrue: [ aPosition ]
		ifFalse: [ aPosition rotateBy: (self angleInRadians: self angle) about: 0 @ 0 ]
]

{ #category : #placing }
TLLayout >> rotateResult: aCollectionOfPoints [
	^ aCollectionOfPoints collect: [ :aPosition | self rotatePoint: aPosition ]
]

{ #category : #angle }
TLLayout >> topToBottom [
	self angle: 90
]

{ #category : #placing }
TLLayout >> translateInPositiveReferencial: result [
	| vector |
	vector := result associations
		inject: 0 @ 0
		into: [ :translation :nodeAndPosition | 
			| dimension |
			dimension := self obtainsNodeDimension: nodeAndPosition key.
			translation max: (nodeAndPosition value - (dimension / 2)) negated ].
	result keysAndValuesDo: [ :aNode :aPosition | aNode position: aPosition + vector ]
]
