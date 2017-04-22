demos
exampleConnectionsCustomization
	<script: 'self exampleConnectionsCustomization open'>
	<tlFilter: #style>
	<tlFilter: #group>
	| visualization source group2 |
	visualization := TLVisualization new.
	source := visualization > #group1 addNodeFromEntity: #source.
	group2 := visualization > #group2.
	{(1 -> #red).
	(2 -> #green).
	(3 -> #blue).
	(4 -> #yellow)} do: [ :asso | (source connectTo: (group2 addNodeFromEntity: asso key)) styleSheet color: (MDLColor tint: asso value) ].
	group2 layout: TLLinearLayout topToBottom.
	^ visualization