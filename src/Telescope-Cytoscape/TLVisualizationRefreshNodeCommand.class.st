"
I am the command for redraw a node 
"
Class {
	#name : #TLVisualizationRefreshNodeCommand,
	#superclass : #TLVisualizationDrawableCommand,
	#instVars : [
		'virtualNode'
	],
	#category : 'Telescope-Cytoscape-Commands'
}

{ #category : #command }
TLVisualizationRefreshNodeCommand class >> command [
	^ #refreshNode
]

{ #category : #'as yet unclassified' }
TLVisualizationRefreshNodeCommand >> customizeFromInteractions: aCollectionOfInteractions forNode: aTLNode [
	self
		mouseOverInteraction:
			(aCollectionOfInteractions
				anySatisfy: [ :interaction | interaction action isPopUp not and: [ interaction shouldOccursOn: 'mouseOver' with: aTLNode ] ]).
	self dropInteraction: (aCollectionOfInteractions anySatisfy: #isDrop).
	self
		popUp:
			(aCollectionOfInteractions
				detect: [ :interaction | interaction action isPopUp ]
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

{ #category : #'as yet unclassified' }
TLVisualizationRefreshNodeCommand >> isAddingCommand [
	^ false
]

{ #category : #json }
TLVisualizationRefreshNodeCommand >> neoJsonOn: writer [
	| data |
	data := {(#id -> self nodeId)} asDictionary.
	self virtualNode hasParentNode
		ifTrue: [ data at: #parent put: self virtualNode parentNode nodeId ].
	writer
		writeMapStreamingDo: [ :jsonMapWriter | 
			jsonMapWriter writeKey: #command value: self class command.
			jsonMapWriter writeKey: #visuId value: self visuId.
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

{ #category : #json }
TLVisualizationRefreshNodeCommand >> nodeId [
	^ self virtualNode nodeId
]

{ #category : #json }
TLVisualizationRefreshNodeCommand >> virtualNode [
	^ virtualNode
]

{ #category : #json }
TLVisualizationRefreshNodeCommand >> virtualNode: anObject [
	virtualNode := anObject
]
