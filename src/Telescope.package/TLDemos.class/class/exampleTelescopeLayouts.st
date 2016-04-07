demos
exampleTelescopeLayouts
	<script: 'self exampleTelescopeLayouts open'>

	| visualization |
	visualization := TLVisualization new.
	visualization addNodesFromEntities: (1 to: 50).
	visualization layout: (TLLinearLayout angle: 210).
	visualization styleSheet
		backgroundColor:
			((MDLColor red property: #yourself gradientAt: 0)to: MDLColor yellow at: 50).
	^ visualization