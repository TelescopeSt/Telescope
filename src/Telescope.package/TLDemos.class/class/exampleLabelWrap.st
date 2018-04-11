demos
exampleLabelWrap
	<script: 'self exampleLabelWrap open'>
	<tlFilter: #style>
	| visualization noWrap automaticWrap forcedWrap ellipsis |
	visualization := TLVisualization new.
	visualization styleSheet
		width: 40;
		height: 40;
		layout:
			((TLLinearLayout perLine: 2)
				gap: 200;
				yourself);
		nodeLabel: #yourself position: #top.
	noWrap := visualization addNodeFromEntity: 'This is a node without wrap'.
	automaticWrap := visualization addNodeFromEntity: 'This is a node with an automatic wrap'.
	automaticWrap styleSheet
		nodeLabelWrap: 'wrap';
		nodeLabelMaxWidth: 100.
	forcedWrap := visualization addNodeFromEntity: 'ThisIsANodeWithAForcedWrap'.
	forcedWrap styleSheet
		nodeLabelWrap: 'wrap';
		nodeLabelMaxWidth: 100;
		nodeLabel: [ :string | string insertLineReturnEvery: 6 ].
	ellipsis := visualization addNodeFromEntity: 'This is a node with an ellipsed label blablablablablabla'.
	self flag: #todo. "It is possible this one does not work yet since it require a more recent cytoscape that what we have."
	ellipsis styleSheet
		nodeLabelWrap: 'ellipsis';
		nodeLabelMaxWidth: 200.
	^ visualization