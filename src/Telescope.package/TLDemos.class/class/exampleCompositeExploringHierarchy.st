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
		childrenLayout:
			((TLLinearLayout maximumDimension: 1200)
				horizontalGap: 30;
				verticalGap: 60;
				yourself);
		nodeLabel: #asString;
		nodeLabelPosition: [ :e :n | 
			n hasChildrenToDisplay
				ifTrue: [ #bottom ]
				ifFalse: [ #inside ] ];
		width: 250;
		compositeExpandedByDefault: true;
		backgroundColor: [ :class | 
			class subclasses isNotEmpty
				ifTrue: [ MDLColor teal alpha: 0.3 ]
				ifFalse: [ MDLColor white ] ].
	visualization addNodeFromEntity: Collection.
	(visualization addInteraction: TLExpandCollapseCompositeNodeAction onCompositeNodeWithChildren onClick) propagateToChildren.
	^ visualization