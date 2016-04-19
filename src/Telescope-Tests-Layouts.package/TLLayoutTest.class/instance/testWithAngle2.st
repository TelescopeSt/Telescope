as yet unclassified
testWithAngle2
	layout angle: 180.
	"This is due to float calculation"
	self assert: (layout rotateResult: {5 @ 5}) first equals:  -5.0 @ -5.000000000000001