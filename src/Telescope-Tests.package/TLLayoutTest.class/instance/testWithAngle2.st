as yet unclassified
testWithAngle2
	| node |
	layout angle: 180.
	node := Mock new.
	layout definePosition: 5 @ 5 forNode: node.
	"This is due to float calculation"
	node should got position: -5.0 @ -5.000000000000001