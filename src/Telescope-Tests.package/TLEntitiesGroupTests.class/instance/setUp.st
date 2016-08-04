running
setUp
	parentMock := protocol mock: 'parent'.
	generatorMock := protocol mock: 'generator'.
	protocol describe
		allow: parentMock recv: #generator;
		=> generatorMock.
	protocol describe
		allow: parentMock recv: #effectiveStyleSheet;
		=> TLStyleSheet default.
	tlGroup := TLEntitiesGroup new.
	tlGroup nodeCreationStrategy: TLNodeCreationStrategy default.
	protocol describe allow: parentMock recv: #addChild:.
	tlGroup parent: parentMock