node facade
definePosition: aPosition forNode: aNode
	"Layouts are always working in an ideal reference, then we place the node with the desired rotation"

	self cache at: aNode put: aPosition