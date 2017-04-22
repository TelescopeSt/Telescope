demos
exampleChangingLayout
	<script: 'self exampleChangingLayout open'>
	<tlFilter: #layout>
	| visu |
	visu := TLVisualization new.
	(visu > #group1) styleSheet
		width: 200;
		height: 50;
		nodeLabel: [ :lay | lay class asString ].
	(visu > #group2) styleSheet
		width: 30;
		height: 30;
		shape: TLRhomboid.
	(visu > #group1)
		layout: TLLinearLayout topToBottom;
		addNodesFromEntities:
			{(TLLinearLayout angle: 90).
			(TLTreeLayout angle: 180).
			TLCircularLayout new};
		addInteraction: (TLCustomAction block: [ :aNode | visu > #group2 layout: aNode entity ]) onClick.
	(visu > #group2)
		addNodesFromEntities: Collection withAllSubclasses;
		connectFollowingProperty: #superclass;
		addInteraction: TLPopUpAction onMouseOver;
		layout: TLCircularLayout.
	visu layout: TLLinearLayout leftToRight.
	^ visu