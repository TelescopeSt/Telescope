removing - interaction
removeInteractionsOf: aNode
	self menuInteractionByDrawable removeKey: aNode ifAbsent: [  ].
	[ 
	(self shapeInteractionByDrawable at: aNode) do: [ :shape | self removeElementnteractionFromView: shape ].
	self shapeInteractionByDrawable removeKey: aNode ]
		on: KeyNotFound
		do: [  ]