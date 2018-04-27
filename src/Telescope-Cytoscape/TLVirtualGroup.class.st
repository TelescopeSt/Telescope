"
I am a virtual group used to compute positions of my elements on the server side when the display is done elsewhere. The goal is to apply layouts on me to then send the right positions to the client.
"
Class {
	#name : #TLVirtualGroup,
	#superclass : #OrderedCollection,
	#traits : 'TVirtualElement',
	#classTraits : 'TVirtualElement classTrait',
	#instVars : [
		'parent',
		'position',
		'encompassingRectangle'
	],
	#category : 'Telescope-Cytoscape-Virtual'
}

{ #category : #'instance creation' }
TLVirtualGroup class >> new: aSize [
	^ (super new: aSize)
		initialize;
		yourself
]

{ #category : #accessing }
TLVirtualGroup >> absolutePosition [
	"A group can have a group or a node as parent. It's probably an error than we just add the absolute position."

	self flag: #thisIsAnError.	"If we add a group in a group in a group some layout will have incorrect positions."
	^ self hasParent
		ifTrue: [ self position + self parent absolutePosition ]
		ifFalse: [ self position ]
]

{ #category : #adding }
TLVirtualGroup >> addChildren: aTLVirtual [
	self addLast: aTLVirtual
]

{ #category : #adding }
TLVirtualGroup >> addFirst: aTLVirtual [
	(self includes: aTLVirtual)
		ifFalse: [ 
			self updateEncompassingByAdding: aTLVirtual.
			super addFirst: aTLVirtual ].
	aTLVirtual parent = self
		ifFalse: [ aTLVirtual parent: self ]
]

{ #category : #adding }
TLVirtualGroup >> addLast: aTLVirtual [
	(self includes: aTLVirtual)
		ifFalse: [ 
			self updateEncompassingByAdding: aTLVirtual.
			super addLast: aTLVirtual ].
	aTLVirtual parent = self
		ifFalse: [ aTLVirtual parent: self ].
	^ aTLVirtual
]

{ #category : #accessing }
TLVirtualGroup >> children [
	Halt now.
	^ self
]

{ #category : #accessing }
TLVirtualGroup >> children: aChildren [
	"If it is a node there is a problem. We should come here from #addAll of another group"
	self assert: aChildren isGroup
]

{ #category : #optimization }
TLVirtualGroup >> clearEncompassingRectangle [
	encompassingRectangle := nil
]

{ #category : #accessing }
TLVirtualGroup >> composite: aVirtualNode [
	parent := aVirtualNode
]

{ #category : #accessing }
TLVirtualGroup >> dimension [
	^ self extent
]

{ #category : #accessing }
TLVirtualGroup >> encompassingRectangle [
	^ encompassingRectangle
		ifNil: [ 
			encompassingRectangle := self
				ifEmpty: [ 0 @ 0 corner: 0 @ 0 ]
				ifNotEmpty: [ Rectangle merging: (self collect: #encompassingRectangle as: OrderedCollection) ] ]
]

{ #category : #accessing }
TLVirtualGroup >> extent [
	^ self encompassingRectangle extent
]

{ #category : #accessing }
TLVirtualGroup >> height [
	^ self encompassingRectangle height
]

{ #category : #initialization }
TLVirtualGroup >> initialize [
	"We do not do the super since a collection do not initialize by default."

	self position: 0 @ 0
]

{ #category : #testing }
TLVirtualGroup >> isGroup [
	^ true
]

{ #category : #testing }
TLVirtualGroup >> isNode [
	^ false
]

{ #category : #dimension }
TLVirtualGroup >> occupyMaxSpace [
	^ false
]

{ #category : #accessing }
TLVirtualGroup >> parent [
	^ parent
]

{ #category : #accessing }
TLVirtualGroup >> parent: anObject [
	anObject children: self.
	parent := anObject
]

{ #category : #accessing }
TLVirtualGroup >> position [
	^ position
]

{ #category : #accessing }
TLVirtualGroup >> position: anObject [
	position := anObject
]

{ #category : #removing }
TLVirtualGroup >> removeAll [
	self clearEncompassingRectangle.
	super removeAll
]

{ #category : #removing }
TLVirtualGroup >> removeAllSuchThat: aBlock [ 
	self clearEncompassingRectangle.
	super removeAllSuchThat: aBlock 
]

{ #category : #removing }
TLVirtualGroup >> removeAt: index [
	self clearEncompassingRectangle.
	super removeAt: index
]

{ #category : #removing }
TLVirtualGroup >> removeFirst [
	self clearEncompassingRectangle.
	super removeFirst
]

{ #category : #removing }
TLVirtualGroup >> removeFirst: n [ 
	self clearEncompassingRectangle.
	super removeFirst: n 
]

{ #category : #removing }
TLVirtualGroup >> removeLast [
	self clearEncompassingRectangle.
	super removeLast
]

{ #category : #removing }
TLVirtualGroup >> removeLast: n [ 
	self clearEncompassingRectangle.
	super removeLast: n 
]

{ #category : #position }
TLVirtualGroup >> restoreElementsPosition [
	"Used because Roassal only translate nodes and do not set their position"
	self do: [ :anElement | anElement position: 0@0 ]
]

{ #category : #private }
TLVirtualGroup >> species [
	^ self class superclass
]

{ #category : #optimization }
TLVirtualGroup >> updateEncompassingByAdding: aTLVirtual [
	encompassingRectangle ifNotNil: [ encompassingRectangle quickMerge: aTLVirtual encompassingRectangle ]
]

{ #category : #accessing }
TLVirtualGroup >> width [
	^ self encompassingRectangle width
]
