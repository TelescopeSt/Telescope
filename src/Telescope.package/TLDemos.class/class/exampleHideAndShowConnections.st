demos
exampleHideAndShowConnections
	"self exampleHideAndShowConnections"

	| visualization oneNode twoNode connection |
	visualization := TLVisualization new.
	oneNode := visualization addNodeFromEntity: 1.
	twoNode := visualization addNodeFromEntity: 2.
	connection := oneNode connectTo: twoNode.
	visualization addInteraction: (TLCustomAction block: [ :aNode | 
		connection isVisible 
			ifTrue: [ connection hide ]
			ifFalse: [ connection show ] ]) onClick.
	visualization open.
	^ visualization
	
	