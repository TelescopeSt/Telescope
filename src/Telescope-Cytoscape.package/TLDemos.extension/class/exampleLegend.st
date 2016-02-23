*Telescope-Cytoscape
exampleLegend
	<script: 'self exampleLegend open'>
	| visualization |
	visualization := TLVisualization new.
	visualization addNodesFromEntities: (1 to: 100).
	visualization legend
		descriptionForHeight: 'Text explaining height';
		descriptionForWidth: 'Text explaining width'.
	^ visualization