as yet unclassified
defaultVisu
	| butterfly |
	butterfly := TLButterfly new
		mainEntity: 2;
		leftEntities: [ :n | 1 to: n - 1 ];
		rightEntities: (10 to: 10).
	butterfly nodeCreationStrategy
		compositeProperty: [ :n | 
			{(n - 100).
			(n + 100)} ].
	butterfly addCompositeDefaultCollapseInteraction.
	^ butterfly