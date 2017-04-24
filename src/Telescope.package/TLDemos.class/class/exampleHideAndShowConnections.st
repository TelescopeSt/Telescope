demos
exampleHideAndShowConnections
	<script: 'self exampleHideAndShowConnections open'>
	<tlFilter: #interaction>
	| visualization secondNode firstNode thirdNode connection connection2 |
	visualization := TLVisualization new.
	visualization layout gap: 50.
	firstNode := visualization addNodeFromEntity: 2.
	secondNode := visualization addNodeFromEntity: 1.
	secondNode styleSheet nodeLabel: 'Click on me!' position: #top.
	thirdNode := visualization addNodeFromEntity: 3.
	connection := secondNode connectTo: firstNode.
	connection2 := secondNode connectTo: thirdNode.
	connection2 hide.
	visualization
		addInteractions:
			{(TLHideAction on: connection) onClick.
			(TLShowAction on: connection2) onClick}.
	^ visualization