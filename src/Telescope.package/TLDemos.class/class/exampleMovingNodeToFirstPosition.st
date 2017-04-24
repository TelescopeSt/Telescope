demos
exampleMovingNodeToFirstPosition
	<script: 'self exampleMovingNodeToFirstPosition open'>
	<tlFilter: #interaction>
	| visualization |
	visualization := TLVisualization fromEntities: ($a to: $f).
	visualization styleSheet nodeLabel: #asString.
	visualization
		layout: TLLinearLayout topToBottom;
		addInteraction: (TLCustomAction block: [ :aNode | visualization moveToFirstPosition: aNode ]) onClick;
		addInteraction: (TLStyleCustomizationAction custom: [ :style | style backgroundColor: Color red ]) onMouseOver.
	^ visualization