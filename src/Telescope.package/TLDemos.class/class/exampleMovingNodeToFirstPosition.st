demos
exampleMovingNodeToFirstPosition
	<script: 'self exampleMovingNodeToFirstPosition open'>

	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet nodeLabel: #asString.
	visualization 
		layout: TLLinearLayout topToBottom;
		addNodesFromEntities: ($a to: $f);
		addInteraction: (TLCustomAction block: [:aNode | visualization moveToFirstPosition: aNode]) onClick;
		addInteraction: (TLStyleCustomizationAction custom: [:style | style backgroundColor: Color red]) onMouseOver.
	^ visualization