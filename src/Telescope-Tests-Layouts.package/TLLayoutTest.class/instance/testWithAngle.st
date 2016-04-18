as yet unclassified
testWithAngle
	| node |
	layout angle: 90.
	node := Mock new.
	layout definePosition: 5 @ 5 forNode: node.
	"This is due to float calculation"
	node should got position: 5.000000000000001 @ -5.0