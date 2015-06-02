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
	tlGroup parent: parentMock