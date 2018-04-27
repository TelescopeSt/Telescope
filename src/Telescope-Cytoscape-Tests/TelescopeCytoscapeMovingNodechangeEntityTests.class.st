Class {
	#name : #TelescopeCytoscapeMovingNodechangeEntityTests,
	#superclass : #TelescopeCytoscapeTestsAbstract,
	#category : 'Telescope-Cytoscape-Tests-Client'
}

{ #category : #'as yet unclassified' }
TelescopeCytoscapeMovingNodechangeEntityTests >> defaultVisu [
	| visualization |
	visualization := TLVisualization new.
	visualization addNodesFromEntities: ((1 to: 1) collect: [ :i | 20 @ 20 ]).
	visualization addInteraction: (TLCustomWithParameterAction block: [ :node :position | node entity: position ]) onMove.
	visualization addInteraction: TLMemorizeNodePositionAction onMove.
	visualization styleSheet nodeLabel: #asString.
	^ visualization
]
