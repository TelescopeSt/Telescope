"
Creates a mock visualization for tests.
"
Class {
	#name : #TLMockVisualization,
	#superclass : #Object,
	#category : #'Telescope-Core-Tests'
}

{ #category : #'as yet unclassified' }
TLMockVisualization class >> create [
	^ self new createVisu
]

{ #category : #building }
TLMockVisualization >> createVisu [
	| visu |
	visu := TLVisualization new.
	visu nodeCreationStrategy compositeProperty: (1 to: 10) asOrderedCollection.
	visu styleSheet
		childrenLayout: TLLinearLayout topToBottom;
		shape: TLEllipse;
		nodeLabel: #mooseName;
		backgroundColor: Color gray.
	visu styleSheet > #children backgroundColor: Color yellow.
	visu
		addInteraction: TLPopUpAction onMouseOver;
		addInteraction: (TLInspectAction withMenu: 'Inspect').
	visu addNodeFromEntity: 42.
	^ visu
]
