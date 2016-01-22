as yet unclassified
testReplaceCameraWhenUpdatingDisable
	| visu |
	visu := TLVisualization new generator: connector.
	protocol describe once: view recv: #signalUpdate.
	visu update.