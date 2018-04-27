"
I am the command for a new node creation
"
Class {
	#name : #TLVisualizationAddNodeCommand,
	#superclass : #TLVisualizationDrawableCommand,
	#instVars : [
		'virtualNode'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationAddNodeCommand class >> command [
	^ #add
]

{ #category : #'as yet unclassified' }
TLVisualizationAddNodeCommand >> customizeFromInteractions: aCollectionOfInteractions forNode: aTLNode [
	self
		mouseOverInteraction:
			(aCollectionOfInteractions
				anySatisfy: [ :interaction | interaction action isPopUp not and: [ interaction shouldOccursOn: 'mouseOver' with: aTLNode ] ]).
	self dropInteraction: (aCollectionOfInteractions anySatisfy: #isDrop).
	self
		popUp:
			(aCollectionOfInteractions
				detect: [ :interaction | interaction action isPopUp and: [interaction condition value: aTLNode] ]
				ifFound: [ :interaction | 
					[ interaction forCytoscapeFromNode: aTLNode ]
						on: TLNilOrEmptyTextException
						do: [ nil ] ]
				ifNone: [ nil ]).
	self
		menu:
			(aCollectionOfInteractions
				select: [ :interaction | interaction shouldOccursOn: #menu with: aTLNode ]
				thenCollect: [ :anInteraction | 
					| dic |
					dic := Dictionary new.
					dic at: 'title' put: anInteraction title.
					anInteraction isMultiChoiceMenu
						ifTrue: [ dic at: #subMenu put: ((anInteraction choicesListForDrawable: aTLNode) collect: anInteraction displayBlock) ].
					dic ])
]

{ #category : #testing }
TLVisualizationAddNodeCommand >> isAddingCommand [
	^ true
]

{ #category : #json }
TLVisualizationAddNodeCommand >> neoJsonOn: writer [
	| data |
	data := {(#id -> self nodeId)} asDictionary.
	self virtualNode hasParentNode
		ifTrue: [ data at: #parent put: self virtualNode parentNode nodeId ].
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #group value: #nodes.
			jsonMapWriter writeKey: #data value: data.
			self virtualNode hasChildren
				ifFalse: [ 
					jsonMapWriter
						writeKey: #position
						value:
							{(#x -> self virtualNode cytoscapePosition x).
							(#y -> self virtualNode cytoscapePosition y)} asDictionary ].
			jsonMapWriter writeKey: #mouseOverInteraction value: self mouseOverInteraction.
			jsonMapWriter writeKey: #dropInteraction value: self dropInteraction.
			self popUp ifNotNil: [ jsonMapWriter writeKey: #popUp value: self popUp ].
			jsonMapWriter writeKey: #style value: self style.
			self menu ifNotEmpty: [ jsonMapWriter writeKey: #menu value: self menu ] ]
]

{ #category : #accessing }
TLVisualizationAddNodeCommand >> nodeId [
	^ self virtualNode nodeId
]

{ #category : #accessing }
TLVisualizationAddNodeCommand >> virtualNode [
	^ virtualNode
]

{ #category : #accessing }
TLVisualizationAddNodeCommand >> virtualNode: anObject [
	virtualNode := anObject
]
