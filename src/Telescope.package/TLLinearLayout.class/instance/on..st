placing
on: aGroup
	| currentPosition maxHeight |
	currentPosition := 0 @ 0.
	maxHeight := 0.
	aGroup
		do: [ :aNode | 
			| nodeDimension |
			nodeDimension := self obtainsNodeDimension: aNode.
			(self newLineStrategy shouldCreateNewLineFrom: currentPosition for: aNode)
				ifTrue: [ 
					currentPosition := 0 @ (currentPosition y + maxHeight + self verticalGap).
					maxHeight := 0 ].
			maxHeight := maxHeight max: nodeDimension y.
			self definePosition: currentPosition + (nodeDimension / 2) forNode: aNode.
			currentPosition := currentPosition + ((self horizontalGap + nodeDimension x) @ 0) ]