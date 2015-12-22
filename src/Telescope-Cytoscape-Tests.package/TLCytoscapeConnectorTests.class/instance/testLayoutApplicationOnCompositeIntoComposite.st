as yet unclassified
testLayoutApplicationOnCompositeIntoComposite
	| group mockLayout childrenMockLayout |
	group := TLEntitiesGroup new.
	mockLayout := protocol mock: 'layout'.
	childrenMockLayout := protocol mock: 'childrenLayout'.
	protocol describe once: mockLayout recv: #on:.
	protocol describe twice: childrenMockLayout recv: #on:.
	group
		nodeCreationStrategy: (TLNodeCreationStrategy composite: [ :i | i to: i + 1 ] withLayout: mockLayout);
		styleSheet: (TLStyleSheet default compositeExpandedByDefault: true).
	group nodeCreationStrategy
		childrenStrategy: (TLNodeCreationStrategy composite: [ :i | i to: i + 5 ] withLayout: childrenMockLayout).
	group addNodeFromEntity: 1.
	group generator: connector.
	group generate