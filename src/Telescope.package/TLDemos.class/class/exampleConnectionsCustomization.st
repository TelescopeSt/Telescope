demos
exampleConnectionsCustomization
	"self exampleConnectionsCustomization"

	| visualization source group2 |
	visualization := TLVisualization new.
	source := visualization > #group1 addNodeFromEntity: #source.
	group2 := visualization > #group2.
	(source connectTo: (group2 addNodeFromEntity: 1)) color: Color red.
	(source connectTo: (group2 addNodeFromEntity: 2)) color: Color green.
	(source connectTo: (group2 addNodeFromEntity: 3)) color: Color blue.
	(source connectTo: (group2 addNodeFromEntity: 4)) color: Color yellow.
	group2 layout: RTVerticalLineLayout.
	visualization open.
	^ visualization