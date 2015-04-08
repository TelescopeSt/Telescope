accessing
layout
	^ layout ifNil: [ RTGridLayout new gapSize: 20 ]