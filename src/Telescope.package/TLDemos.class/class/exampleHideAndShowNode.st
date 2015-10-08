demos
exampleHideAndShowNode
	"self exampleHideAndShowNode"

	| visualization oneNode secondNode  |
	visualization := TLVisualization new.
	oneNode := visualization addNodeFromEntity: 1.
	oneNode nodeLabel: 'Click on me!'.
	secondNode := visualization addNodeFromEntity: 2.
	oneNode addInteraction: (TLCustomAction block: [ :aNode | 
		secondNode isVisible 
			ifTrue: [ secondNode hide ]
			ifFalse: [ secondNode show ] ]) onClick.
	visualization open.
	^ visualization
	
	