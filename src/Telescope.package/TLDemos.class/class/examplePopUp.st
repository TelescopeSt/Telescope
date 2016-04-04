demos
examplePopUp
	<script: 'self examplePopUp open'>
	| visu |
	visu := TLVisualization new.
	visu addInteraction: (TLPopUpAction text: #asString position: TLPosition  left bottom) onMouseOver.
	visu addNodesFromEntities: (1 to: 20).
	^ visu