running
setUp
	parentMock := protocol mock: 'parent'.
	generatorMock := protocol mock: 'generator'.
	protocol describe allow: parentMock recv: #generator; => generatorMock.
	tlGroup := TLEntitiesGroup new.
	tlGroup parent: parentMock.