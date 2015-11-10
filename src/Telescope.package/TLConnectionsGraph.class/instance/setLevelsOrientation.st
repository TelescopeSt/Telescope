private
setLevelsOrientation
	self edgeDirection = #incoming
		ifTrue: [ levelsCollection := levelsCollection reversed ]