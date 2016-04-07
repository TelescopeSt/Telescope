placing
on: aGroup
	| currentPosition maxHeight nodesOnLine |
	currentPosition := 0 @ 0.
	maxHeight := 0.
	nodesOnLine := 1.
	aGroup
		do: [ :aNode | 
			| nodeDimension |
			nodeDimension := self obtainsNodeDimension: aNode.
			(self newLineStrategy shouldCreateNewLineFrom: currentPosition currentNodeNumberOnLine: nodesOnLine forDimension: aNode dimension)
				ifTrue: [ currentPosition := 0 @ (currentPosition y + maxHeight + self verticalGap).
					maxHeight := 0.
					nodesOnLine := 1 ].
			maxHeight := maxHeight max: nodeDimension y.
			nodesOnLine := nodesOnLine + 1.
			self definePosition: currentPosition + (nodeDimension / 2) forNode: aNode.
			currentPosition := currentPosition + ((self horizontalGap + nodeDimension x) @ 0) ]