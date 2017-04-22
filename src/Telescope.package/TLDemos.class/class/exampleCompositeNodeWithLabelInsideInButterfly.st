not working demos
exampleCompositeNodeWithLabelInsideInButterfly
	<script: 'self exampleCompositeNodeWithLabelInsideInButterfly open'>
	<tlFilter: #composite>
	<tlFilter: #visuTemplate>
	| butterfly |
	self flag: 'Invalid demo; cannot run like this. #addCompositeDefaultCollapseInteraction is broken because of Triggers.'.
	butterfly := TLButterfly new
		mainEntity: 10;
		leftEntities: [ :n | 1 to: n - 1 ];
		rightEntities: (15 to: 20).
	butterfly nodeCreationStrategy
		compositeProperty: [ :n | 
			{(n - 100).
			(n + 100)} ].
	butterfly addCompositeDefaultCollapseInteraction.
	^ butterfly