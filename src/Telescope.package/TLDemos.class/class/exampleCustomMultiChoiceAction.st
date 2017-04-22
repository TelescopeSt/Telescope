demos
exampleCustomMultiChoiceAction
	<script: 'self exampleCustomMultiChoiceAction open'>
	<tlFilter: #interaction>
	| visu |
	visu := TLVisualization new.
	visu layout: (TLLinearLayout gap: 40).
	visu styleSheet nodeLabel: #asString position: #top.
	visu addNodesFromEntities: #(Henry John Catherine Paule Isabel).

	"Print on Transcript selected node and selected item in the menu obtains from a right click."
	visu
		addInteraction:
			((TLCustomWithParameterAction block: [ :node :choice | Transcript show: node entity asString , ' wants ' , choice , String cr ])
				withMultipleChoices: [ :aNode | #('french fries' 'potatoes' 'mashed potatoes' 'baked potatoes') ]
				menu: 'Choose your dish').
	^ visu