demos
exampleLegend
	<script: 'self exampleLegend open'>
	<tlFilter: #legend>
	| visualization |
	visualization := TLVisualization fromEntities: (1 to: 100).
	visualization legend
		descriptionForHeight: 'Text explaining height';
		descriptionForWidth: 'Text explaining width'.
	^ visualization