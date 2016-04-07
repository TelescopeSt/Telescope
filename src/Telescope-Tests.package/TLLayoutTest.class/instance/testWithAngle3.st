as yet unclassified
testWithAngle3
	| node |
	layout angle: 90.
	node := Mock new.
	layout definePosition: -4 @ -4 forNode: node.
	"This is due to float calculation"
	node should got position: -4.0 @ 4.000000000000001