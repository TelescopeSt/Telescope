as yet unclassified
setUp
	visualization := TLVisualization new.
	mockGenerator := protocol mock: 'generator'.
	visualization generator: mockGenerator.