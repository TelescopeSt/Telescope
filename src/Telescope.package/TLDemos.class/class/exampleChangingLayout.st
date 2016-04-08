demos
exampleChangingLayout
	<script: 'self exampleChangingLayout open'>

	| visu |
	visu := TLVisualization new.
	visu styleSheet width: 200; height: 50.
	visu > #group1 layout: TLLinearLayout topToBottom.
	visu > #group1 addNodesFromEntities: (RTLayout allSubclasses reject: #isAbstract).
	visu > #group2 addNodesFromEntities: Collection withAllSubclasses.
	visu > #group2 connectFollowingProperty: #superclass.
	visu > #group1 addInteraction: (TLCustomAction  block: [ :aNode |
		 visu > #group2 layout: aNode entity. visu update ]) onClick.
	visu styleSheet nodeLabel: #name.
	^ visu