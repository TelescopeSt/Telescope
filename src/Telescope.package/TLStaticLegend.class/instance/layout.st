accessing
layout
	^ layout ifNil: [ TLLinearLayout gap: 20 maximumDimension: 150 ]