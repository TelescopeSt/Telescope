demos
exampleCompositeNodeWithLabelInsideInButterfly
	<script: 'self exampleCompositeNodeWithLabelInsideInButterfly open'>
	| butterfly |
	
	butterfly := TLButterfly new
		mainEntity: 10;
		leftEntities: [ :n | 1 to: n - 1 ];
		rightEntities: (15 to: 20).
	butterfly nodeCreationStrategy compositeProperty: [ :n | 
			{(n - 100).
			(n + 100)} ].
	butterfly addCompositeDefaultCollapseInteraction.
	^ butterfly
	