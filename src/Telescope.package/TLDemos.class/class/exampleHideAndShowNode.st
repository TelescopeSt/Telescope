demos
exampleHideAndShowNode
	"self exampleHideAndShowNode"

	| visualization oneNode secondNode  |
	visualization := TLVisualization new.
	oneNode := visualization addNodeFromEntity: 1.
	oneNode nodeLabel: 'Click on me!'.
	secondNode := visualization addNodeFromEntity: 2.
	oneNode addInteraction: (TLHideAction on: secondNode) onClick.
	visualization open.
	^ visualization
	
	