demos
examplePopUp
	<script: 'self examplePopUp open'>
	<tlFilter: #interaction>
	| visu |
	visu := TLVisualization new.
	#(top center bottom) do: [ :vert | #(left center right) do: [ :hor | visu addNodeFromEntity: vert -> hor ] ].
	visu layout: (TLLinearLayout perLine: 3).
	visu
		addInteraction:
			(TLPopUpAction
				text: #asString
				position: [ :each | 
					TLPosition new
						horizontal: each value;
						vertical: each key;
						yourself ]) onMouseOver.
	^ visu