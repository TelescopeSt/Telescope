demos
exampleTelescopeLayouts
	<script: 'self exampleTelescopeLayouts open'>
	| visualization |
	visualization := TLVisualization new.
	visualization addNodesFromEntities: (1 to: 500).
	visualization layout: ((TLLinearLayout maximumDimension: 300) angle: 210).
	visualization styleSheet backgroundColor: ((MDLColor red property: #yourself gradientAt: 0) to: MDLColor yellow at: 500).
	^ visualization