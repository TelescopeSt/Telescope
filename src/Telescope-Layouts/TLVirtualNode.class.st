"
I am a virtual node used to compute positions on the server side when the display is done elsewhere. The goal is to apply layouts on me to then send the right positions to the client.

position is the same as rectangle: the upper left corner
"
Class {
	#name : #TLVirtualNode,
	#superclass : #Object,
	#traits : 'TVirtualElement',
	#classTraits : 'TVirtualElement classTrait',
	#instVars : [
		'position',
		'dimension',
		'parent',
		'children',
		'compositeMargin',
		'encompassingRectangle',
		'triggers',
		'tlNode'
	],
	#category : #'Telescope-Layouts-Virtuals'
}

{ #category : #accessing }
TLVirtualNode >> absolutePosition [
	"A VirtualNode will always have a group as parent. We take the upper left position of the parent because the layouts will place nodes regarding on it."

	^ self hasParent
		ifTrue: [ self position + self parent upperLeftAbsolutePosition ]
		ifFalse: [ self position ]
]

{ #category : #accessing }
TLVirtualNode >> addChildren: aChildren [
	self children addChildren: aChildren
]

{ #category : #accessing }
TLVirtualNode >> addTrigger: aTLVirtualTrigger [
	triggers add: aTLVirtualTrigger.
	aTLVirtualTrigger virtualNodeReference: self.
]

{ #category : #position }
TLVirtualNode >> calculateRelativePositionFromAbsolute: aPosition [
	^ aPosition
		-
			(self hasParent
				ifTrue: [ parent upperLeftAbsolutePosition ]
				ifFalse: [ 0 @ 0 ])
]

{ #category : #accessing }
TLVirtualNode >> children [
	^ children
]

{ #category : #accessing }
TLVirtualNode >> children: anObject [
	children := anObject
]

{ #category : #optimization }
TLVirtualNode >> clearEncompassingRectangle [
	encompassingRectangle := nil
]

{ #category : #accessing }
TLVirtualNode >> compositeMargin [
	^ compositeMargin ifNil: [ 10@10 ]
]

{ #category : #accessing }
TLVirtualNode >> compositeMargin: anObject [
	compositeMargin := anObject
]

{ #category : #accessing }
TLVirtualNode >> dimension [
	^ self hasChildren
		ifTrue: [ self children encompassingRectangle extent + (2 * self compositeMargin) ]
		ifFalse: [ dimension ]
]

{ #category : #accessing }
TLVirtualNode >> dimension: anObject [
	dimension := anObject.
	self clearEncompassingRectangle.
	self dimensionChangedHook
]

{ #category : #accessing }
TLVirtualNode >> dimensionChangedHook [
	"My subclasses should override me to apply the dimension change to their real nodes to match the dimensions of the tlNode."
	
	self subclassResponsibility
]

{ #category : #accessing }
TLVirtualNode >> encompassingRectangle [
	^ encompassingRectangle ifNil: [ encompassingRectangle := Rectangle center: self position extent: self dimension ]
]

{ #category : #accessing }
TLVirtualNode >> extent [
	^ self dimension
]

{ #category : #accessing }
TLVirtualNode >> hasChildren [
	^ self children notEmpty 
]

{ #category : #accessing }
TLVirtualNode >> height [
	^ self dimension y
]

{ #category : #dimension }
TLVirtualNode >> height: anInteger [
	self dimension: self dimension x @ anInteger
]

{ #category : #adjacent }
TLVirtualNode >> incomingAdjacentNodes [
	^ self tlNode incomingAdjacentNodes
		collect: [ :node | 
			[ node generator elementFromTLDrawable: node ]
				on: NotFound
				do: [ node generate ] ]
]

{ #category : #accessing }
TLVirtualNode >> initialize [
	super initialize.
	self children: (TLVirtualGroup new composite: self).
	triggers:= OrderedCollection new 
]

{ #category : #testing }
TLVirtualNode >> isNode [
	^ true
]

{ #category : #dimension }
TLVirtualNode >> occupyMaxSpace [
	^ self tlNode effectiveStyleSheet takeAllSpace
]

{ #category : #adjacent }
TLVirtualNode >> outgoingAdjacentNodes [
	^ self tlNode outgoingAdjacentNodes
		collect: [ :node | 
			[ node generator elementFromTLDrawable: node ]
				on: NotFound
				do: [ node generate ] ]
]

{ #category : #accessing }
TLVirtualNode >> parent [
	^ parent
]

{ #category : #accessing }
TLVirtualNode >> parent: aParent [
	parent := aParent.
	aParent addChildren: self.
	
]

{ #category : #accessing }
TLVirtualNode >> position [
	^ position
]

{ #category : #accessing }
TLVirtualNode >> position: anObject [
	position := anObject.
	self clearEncompassingRectangle
]

{ #category : #printing }
TLVirtualNode >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(;
		<< (self tlNode ifNotNil: [ :node | node entity asString ] ifNil: [ 'No real node associated yet' ]);
		<< $)
]

{ #category : #dimension }
TLVirtualNode >> restoreOriginalDimension [
	| styleSheet |
	styleSheet := self tlNode effectiveStyleSheet.
	self
		dimension:
			(styleSheet obtainValue: #width forEntity: self tlNode entity inNode: self tlNode)
				@ (styleSheet obtainValue: #height forEntity: self tlNode entity inNode: self tlNode)
]

{ #category : #accessing }
TLVirtualNode >> tlNode [
	^ tlNode
]

{ #category : #accessing }
TLVirtualNode >> tlNode: anObject [
	tlNode := anObject
]

{ #category : #accessing }
TLVirtualNode >> triggers [
	^ triggers
]

{ #category : #accessing }
TLVirtualNode >> width [
	^ self dimension x
]

{ #category : #accessing }
TLVirtualNode >> x [
	^ self position x
]

{ #category : #accessing }
TLVirtualNode >> y [
	^ self position y
]
