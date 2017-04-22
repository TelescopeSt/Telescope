demos
exampleCompositeExploringHierarchy
	<script: 'self exampleCompositeExploringHierarchy open'>
	<tlFilter: #layout>
	<tlFilter: #composite>
	| visualization |
	visualization := TLVisualization new.
	visualization nodeCreationStrategy
		beRecursive;
		compositeProperty: #subclasses.
	visualization styleSheet
		childrenLayout: (TLLinearLayout gap: 20 maximumDimension: 1200);
		nodeLabel: #asString;
		width: 250;
		compositeExpandedByDefault: true;
		backgroundColor: [ :class | 
			class subclasses isNotEmpty
				ifTrue: [ MDLColor teal alpha: 0.3 ]
				ifFalse: [ MDLColor white ] ].
	visualization addNodeFromEntity: Collection.
	(visualization addInteraction: (TLExpandCollapseCompositeNodeAction condition: [ :drawable | drawable isNode and: [ drawable isComposite and: [ drawable hasChildren ] ] ]) onClick)
		propagateToChildren.
	^ visualization