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
		childrenLayout: (TLLinearLayout gap: 20 maximumDimension: 300);
		nodeLabel: #asString;
		width: 200;
		compositeExpandedByDefault: true;
		backgroundColor: [ :class | 
					class subclasses isNotEmpty
						ifTrue: [ Color lightOrange alpha: 0.5 ]
						ifFalse: [ Color white ] ].
	visualization
		addNodeFromEntity: Collection;
		addCompositeDefaultCollapseInteraction.
	^ visualization