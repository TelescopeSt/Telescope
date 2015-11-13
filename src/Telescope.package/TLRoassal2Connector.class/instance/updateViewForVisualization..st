view
updateViewForVisualization: aTLVisualization
	aTLVisualization shouldReplaceCameraWhenUpdating ifTrue:
	[self view updateAndAdjustCamera] ifFalse: [ self view signalUpdate ]