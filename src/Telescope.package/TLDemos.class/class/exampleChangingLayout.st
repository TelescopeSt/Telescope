demos
exampleChangingLayout
	<script: 'self exampleChangingLayout open'>
	| visu |
	visu := TLVisualization new.
	(visu > #group1) styleSheet
		width: 200;
		height: 50.
		(visu > #group2) styleSheet
		width: 30;
		height: 30; shape: TLRhomboid .
	visu > #group1 layout: TLLinearLayout topToBottom.
	visu > #group1
		addNodesFromEntities:
			{(TLLinearLayout angle: 90).
			(TLTreeLayout angle: 180)}.
	visu > #group2 addNodesFromEntities: Collection withAllSubclasses.
	visu > #group2 connectFollowingProperty: #superclass.
	visu > #group2 addInteraction: TLPopUpAction onMouseOver.
	visu > #group1
		addInteraction:
			(TLCustomAction
				block: [ :aNode | 
					visu > #group2 layout: aNode entity.
					visu update ]) onClick.
	(visu > #group1) styleSheet nodeLabel: #asString.
	^ visu