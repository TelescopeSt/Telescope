"
A TLEntities is the superclass for every classes that will represent a telescope entity; a thing able to be displayed and to have interactions...

"
Class {
	#name : #TLDrawable,
	#superclass : #TLObject,
	#traits : 'TStyledElement',
	#classTraits : 'TStyledElement classTrait',
	#instVars : [
		'parent',
		'interactions',
		'generator',
		'isUpdateRequired',
		'isLayoutApplicationRequired',
		'styles',
		'styleSheet',
		'isVisible',
		'state'
	],
	#category : #'Telescope-Core-Model'
}

{ #category : #testing }
TLDrawable class >> isAbstract [
	^ self = TLDrawable
]

{ #category : #accessing }
TLDrawable >> addAllInteractions: aCollectionOfTLNodeInteractions [
	aCollectionOfTLNodeInteractions do: [ :interaction | self addInteraction: interaction ]
]

{ #category : #accessing }
TLDrawable >> addInteraction: aTLInteraction [
	self interactions addLast: aTLInteraction.
	aTLInteraction container: self.
	^ aTLInteraction 
]

{ #category : #accessing }
TLDrawable >> addInteractions: aCollectionOfInteractions [ 
	aCollectionOfInteractions do: [ :anInteraction | self addInteraction: anInteraction ]
]

{ #category : #style }
TLDrawable >> addStyle: aStyleSymbol [
	self assert: aStyleSymbol isSymbol description: 'A style must be a ByteSymbol'. 
	self styles addLast: aStyleSymbol.
	self requireUpdate
]

{ #category : #interactions }
TLDrawable >> allInheritedInteractions [
	^ self allInteractions select: #inherited
]

{ #category : #interactions }
TLDrawable >> allInteractions [
	"return the local interactions and interactions inherited from the parent"

	^ (self parent
		ifNil: [ #() ]
		ifNotNil: [ 
			self parent isNode
				ifTrue: [ self parent allInheritedInteractions ]
				ifFalse: [ self parent allInteractions ] ]) , self interactions
]

{ #category : #private }
TLDrawable >> allValidInteractionsOfKind: anInteractionClass [
	^ self allInteractions
		select: [ :anInteraction | anInteraction class = anInteractionClass and: [ anInteraction condition value: self ] ]
]

{ #category : #converting }
TLDrawable >> asTLDrawableCollection [
	^ TLDrawableCollection with: self
]

{ #category : #style }
TLDrawable >> backgroundColor: aColor [ 
	self styleSheet backgroundColor: aColor
]

{ #category : #style }
TLDrawable >> defaultStyle [
	^ #drawable
]

{ #category : #'private-connector' }
TLDrawable >> generate [
	| result |
	"Do not override this method"
	result :=  self generateWith: self generator.
	self updateDone.
	self layoutApplicationDone.
	^ result
]

{ #category : #'private-connector' }
TLDrawable >> generateWith: aGenerator [
	self subclassResponsibility 
]

{ #category : #accessing }
TLDrawable >> generator [
	^ generator ifNotNil: [ generator ] ifNil: [ self parent generator ]
]

{ #category : #accessing }
TLDrawable >> generator: anObject [
	generator := anObject
]

{ #category : #testing }
TLDrawable >> hasEntity [
	^ false
]

{ #category : #initialization }
TLDrawable >> hide [
	self isVisible: false
]

{ #category : #private }
TLDrawable >> hierarchyChangeManaged [
	^ self state
		removeKey: #hierarchyChanged
		ifAbsent: [ 
			"do nothing"
			 ]
]

{ #category : #private }
TLDrawable >> hierarchyChanged [
	^ self state at: #hierarchyChanged ifAbsent: [ false ]
]

{ #category : #private }
TLDrawable >> hierarchyHasChanged [
	"If the hierarchy changed now we propagate it to parent"

	| changedBefore |
	changedBefore := self hierarchyChanged.
	self state at: #hierarchyChanged put: true.
	self isUpdateRequired: true.
	changedBefore
		ifFalse: [ self parent ifNotNil: [ self parent hierarchyHasChanged ] ]
]

{ #category : #initialization }
TLDrawable >> initialize [
	super initialize.
	state := SmallDictionary new.
	self initializeStyle.
	interactions := OrderedCollection new.
	isUpdateRequired := false.
	isLayoutApplicationRequired := false.
	isVisible := true
]

{ #category : #initialization }
TLDrawable >> initializeStyle [
	self styles: OrderedCollection new.
	self addStyle: self defaultStyle
]

{ #category : #accessing }
TLDrawable >> interactions [
	^ interactions
]

{ #category : #accessing }
TLDrawable >> interactions: anObject [
	interactions := anObject
]

{ #category : #testing }
TLDrawable >> isCompositeNode [
	^ false
]

{ #category : #testing }
TLDrawable >> isConnection [
	^ false
]

{ #category : #testing }
TLDrawable >> isGroup [
	^ false
]

{ #category : #accessing }
TLDrawable >> isLayoutApplicationRequired [
	^ isLayoutApplicationRequired
]

{ #category : #accessing }
TLDrawable >> isLayoutApplicationRequired: anObject [
	isLayoutApplicationRequired := anObject
]

{ #category : #testing }
TLDrawable >> isNode [
	^ false
]

{ #category : #testing }
TLDrawable >> isSimpleNode [
	^ false
]

{ #category : #accessing }
TLDrawable >> isUpdateRequired [
	^ isUpdateRequired
]

{ #category : #accessing }
TLDrawable >> isUpdateRequired: aBoolean [
	isUpdateRequired := aBoolean
]

{ #category : #accessing }
TLDrawable >> isVisible [
	^ isVisible and: [ self parent isNil ifTrue: [ true ] ifFalse: [self parent isVisible] ]
]

{ #category : #accessing }
TLDrawable >> isVisible: aBoolean [
	isVisible ~= aBoolean ifFalse: [ ^ self ].
	
	isVisible := aBoolean.
	self requireUpdateAndLayoutApplication
]

{ #category : #testing }
TLDrawable >> isVisualization [
	^ false
]

{ #category : #state }
TLDrawable >> layoutApplicationDone [
	self isLayoutApplicationRequired: false
]

{ #category : #sugar }
TLDrawable >> mouseOverPopUp [
	self addInteraction: TLPopUpAction onMouseOver
]

{ #category : #actions }
TLDrawable >> moveToGroup: aTLEntitiesGroup [
	self parent requireUpdateAndLayoutApplication.
	aTLEntitiesGroup addDrawable: self.
	self requireUpdateAndLayoutApplication.
]

{ #category : #accessing }
TLDrawable >> parent [
	^ parent
]

{ #category : #accessing }
TLDrawable >> parent: aParent [
	| oldParent |
	oldParent := parent.
	oldParent ifNotNil: [ oldParent removeChild: self ].
	aParent ifNotNil: [ aParent addChild: self ].
	parent := aParent.
	oldParent = parent
		ifFalse: [ 
			self hierarchyHasChanged.
			oldParent ifNotNil: [ oldParent hierarchyHasChanged ] ].
	self requireUpdateAndLayoutApplication
]

{ #category : #accessing }
TLDrawable >> parentNode [
	^ (self parent isNil or: [ self parent isNode ])
		ifTrue: [ self parent ]
		ifFalse: [ self parent parentNode ]
]

{ #category : #position }
TLDrawable >> position [
	^ (self generator elementFromTLDrawable: self) position
]

{ #category : #actions }
TLDrawable >> remove [
	self parent remove: self
]

{ #category : #interactions }
TLDrawable >> removeAllInteractions [
	self interactions removeAll
]

{ #category : #style }
TLDrawable >> removeStyle: aStyleSymbol [
	self assert: aStyleSymbol isSymbol description: 'A style must be a ByteSymbol'.
	(self styles includes: aStyleSymbol)
		ifTrue: [ 
			self styles remove: aStyleSymbol.
			self requireUpdateAndLayoutApplication ]
]

{ #category : #'private-connector' }
TLDrawable >> removeWith: aTLConnector [
	self subclassResponsibility
]

{ #category : #actions }
TLDrawable >> removed [
	parent := nil.
]

{ #category : #state }
TLDrawable >> requireLayoutApplication [
	self parent ifNotNil: [ self parent requireLayoutApplication ].
	self isLayoutApplicationRequired: true
]

{ #category : #state }
TLDrawable >> requireUpdate [
	self parent ifNotNil: [ self parent requireUpdate ].
	self isUpdateRequired: true
]

{ #category : #state }
TLDrawable >> requireUpdateAndLayoutApplication [
	self requireUpdate.
	self requireLayoutApplication 
]

{ #category : #style }
TLDrawable >> shape [
	^ self effectiveStyleSheet shape
]

{ #category : #style }
TLDrawable >> shape: aShape [
	self styleSheet shape: aShape
]

{ #category : #initialization }
TLDrawable >> show [
	self isVisible ifTrue: [ ^ self ].
	
	self isVisible: true.
	"self generateWith: self generator"
]

{ #category : #accessing }
TLDrawable >> state [
	^ state
]

{ #category : #accessing }
TLDrawable >> state: anObject [
	state := anObject
]

{ #category : #style }
TLDrawable >> styleSheet [
	^ styleSheet ifNil: [ styleSheet := self styleSheetClass new ]
]

{ #category : #style }
TLDrawable >> styleSheet: aStyleSheet [
	styleSheet := aStyleSheet
]

{ #category : #initialization }
TLDrawable >> styleSheetClass [
	^ TLStyleSheet 
]

{ #category : #style }
TLDrawable >> styles [
	^ styles
]

{ #category : #style }
TLDrawable >> styles: aCollectionOfStyles [
	styles := aCollectionOfStyles
]

{ #category : #'private-connector' }
TLDrawable >> update [
	"Do not override this method"
	self updateWith: self generator
]

{ #category : #state }
TLDrawable >> updateDone [
	self isUpdateRequired: false
]

{ #category : #'private-connector' }
TLDrawable >> updateWith: aGenerator [
	self subclassResponsibility
]

{ #category : #accessing }
TLDrawable >> visualization [
	^ self parent ifNotNil: [self parent visualization]
]
