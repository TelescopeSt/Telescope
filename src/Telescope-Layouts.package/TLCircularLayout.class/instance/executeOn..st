placing
executeOn: aGroup
	| angleByNode diagonalSum radius |
	angleByNode := Float twoPi / aGroup size.
	diagonalSum := aGroup sum: [ :aNode | aNode dimension dist: 0@0 ].
	radius := (self arcGap * aGroup size + diagonalSum) / Float twoPi.
	aGroup
		doWithIndex: [ :aNode :anIndex | 
			| nodeAngle |
			nodeAngle := anIndex * angleByNode.
			self definePosition: (nodeAngle cos * radius) @ (nodeAngle sin * radius) forNode: aNode ]