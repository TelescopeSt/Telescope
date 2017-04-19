demos
exampleCustomMultiChoiceAction
	<script: 'self exampleCustomMultiChoiceAction open'>
	<tlFilter: #interaction>
	"print on Transcript selected node and selected item in the menu"

	| visu |
	visu := TLVisualization new.
	visu nodeLabel: #asString.
	visu addNodesFromEntities: #(Henry John Catherine Paule Isabel).
	visu addInteraction:
		((TLCustomWithParameterAction block: [:node :choice | Transcript show: node entity asString , ' wants ' , choice , String cr]) withMultipleChoices: [ :aNode | #('french fries' 'potatoes' 'mashed potatoes' 'baked potatoes') ]	menu: 'Choose your dish').
	^ visu