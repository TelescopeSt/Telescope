demos
exampleHideAndShowNode
	<script: 'self exampleHideAndShowNode open'>
	<tlFilter: #interaction>
	| visualization secondNode firstNode thirdNode |
	visualization := TLVisualization new.
	visualization layout gap: 50.
	firstNode := visualization addNodeFromEntity: 2.
	secondNode := visualization addNodeFromEntity: 1.
	secondNode styleSheet nodeLabel: 'Click on me!' position: #top.
	thirdNode := visualization addNodeFromEntity: 3.
	thirdNode hide.
	secondNode
		addInteractions:
			{(TLHideAction on: firstNode) onClick.
			(TLShowAction on: thirdNode) onClick}.
	^ visualization