as yet unclassified
testLayoutApplicationOnComposite
	| group mockLayout |
	group := TLEntitiesGroup new.
	mockLayout := protocol mock: 'layout'.
	protocol describe once: mockLayout recv: #on:.
	group
		nodeCreationStrategy: (TLNodeCreationStrategy composite: [:i | i to: i + 5] withLayout: mockLayout);
		styleSheet: (TLStyleSheet default compositeExpandedByDefault: true).
	group addNodeFromEntity: 1.
	group generator: connector.
	group generate.