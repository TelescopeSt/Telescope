as yet unclassified
testReplaceCameraWhenUpdatingEnable
	| visu |
	visu := TLVisualization new generator: connector.
	visu replaceCameraWhenUpdating.
	protocol describe once: view recv: #updateAndAdjustCamera.
	visu update.