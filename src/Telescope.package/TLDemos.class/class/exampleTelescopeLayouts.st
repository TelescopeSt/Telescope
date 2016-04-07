demos
exampleTelescopeLayouts
	<script: 'self exampleTelescopeLayouts open'>
	| visualization |
	visualization := TLVisualization new.
	visualization addNodesFromEntities: (1 to: 360).
	visualization layout: ((TLLinearLayout maximumDimension: 300) angle: 360 atRandom).
	visualization styleSheet
		backgroundColor: ((MDLColor red property: #yourself gradientAt: 0) to: MDLColor yellow at: 360).
	visualization
		addInteraction:
			(TLCustomAction
				block: [ :node | 
					visualization layout angle: node entity.
					visualization requireLayoutApplication ]) onClick.
	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization