node facade
definePosition: aPosition forNode: aNode
	"Layouts are always working in an ideal reference, then we place the node with the desired rotation"
	aNode
		position:
			(self angle = 0
				ifTrue: [ aPosition ]
				ifFalse: [ aPosition rotateBy: self angleInRadian about: 0 @ 0 ])