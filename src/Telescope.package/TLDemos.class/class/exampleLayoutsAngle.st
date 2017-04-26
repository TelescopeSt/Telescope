demos
exampleLayoutsAngle
	<script: 'self exampleTelescopeLayouts open'>
	<tlFilter: #layout>
	| visualization |
	visualization := TLVisualization fromEntities: (0 to: 359).
	visualization layout: ((TLLinearLayout maximumDimension: 300) angle: 360 atRandom).
	visualization styleSheet backgroundColor: ((MDLColor red property: #yourself gradientAt: 0) to: MDLColor yellow at: 360).
	visualization
		addInteraction:
			(TLCustomAction
				block: [ :node | 
					visualization layout angle: node entity.
					visualization requireLayoutApplication ]) onClick.
	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization