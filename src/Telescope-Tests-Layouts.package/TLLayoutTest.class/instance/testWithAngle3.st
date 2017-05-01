tests
testWithAngle3
	layout angle: 90.
	"This is due to float calculation"
	self assert: (layout rotateResult: {5 @ 5}) first equals:  -4.0 @ 4.000000000000001