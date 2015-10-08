demos
exampleHideAndShowConnections
	"self exampleHideAndShowConnections"

	| visualization oneNode twoNode connection |
	visualization := TLVisualization new.
	oneNode := visualization addNodeFromEntity: 1.
	twoNode := visualization addNodeFromEntity: 2.
	connection := oneNode connectTo: twoNode.
	visualization addInteraction: (TLHideAction on: connection) onClick.
	visualization open.
	^ visualization
	
	