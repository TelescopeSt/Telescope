tests
testWithAngle
	layout angle: 90.	
	"This is due to float calculation"
	self assert: (layout rotateResult: {5 @ 5}) first equals: 5.000000000000001 @ -5.0