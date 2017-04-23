demos
exampleGradient
	<script: 'self exampleGradient open'>
	<tlFilter: #style>
	| visu |
	visu := TLVisualization fromEntities: (1 to: 60).
	visu styleSheet
		backgroundColor:
			((MDLColor red property: #yourself gradientAt: 5)
				to: MDLColor orange at: 15;
				to: MDLColor yellow at: 30;
				to: MDLColor green at: 50).
	^ visu