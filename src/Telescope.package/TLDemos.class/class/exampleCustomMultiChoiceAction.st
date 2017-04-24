demos
exampleCustomMultiChoiceAction
	<script: 'self exampleCustomMultiChoiceAction open'>
	<tlFilter: #interaction>
	| visu |
	visu := TLVisualization fromEntities: #(Henry John Catherine Paule Isabel).
	visu layout gap: 40.
	visu styleSheet nodeLabel: #asString position: #top.

	"Print on Transcript selected node and selected item in the menu obtains from a right click."
	visu
		addInteraction:
			((TLCustomWithParameterAction
				block: [ :node :choice | 
					Transcript
						show: node entity asString;
						show: ' wants ';
						show: choice;
						cr ]) withMultipleChoices: [ :aNode | #('french fries' 'potatoes' 'mashed potatoes' 'baked potatoes') ] menu: 'Choose your dish').
	^ visu