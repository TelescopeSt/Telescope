placing
layoutApplicationOn: aGroup
	| nodesOnLine lineOfNodesWithPosition maxHeight currentPosition |
	currentPosition := 0 @ 0.
	maxHeight := 0.
	nodesOnLine := 1.
	lineOfNodesWithPosition := OrderedDictionary new.
	aGroup
		do: [ :aNode | 
			| nodeDimension |
			nodeDimension := self obtainsNodeDimension: aNode.
			(self newLineStrategy
				shouldCreateNewLineFrom: currentPosition
				currentNodeNumberOnLine: nodesOnLine
				forDimension: aNode dimension)
				ifTrue: [ 
					currentPosition := 0 @ (currentPosition y + maxHeight + self verticalGap).
					nodesOnLine := 1.
					self placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight.
					maxHeight := 0.
					lineOfNodesWithPosition removeAll ].
			maxHeight := maxHeight max: nodeDimension y.
			nodesOnLine := nodesOnLine + 1.
			lineOfNodesWithPosition at: aNode put: currentPosition + (nodeDimension / 2) -> nodeDimension y.
			currentPosition := currentPosition + ((self horizontalGap + nodeDimension x) @ 0) ].
	self placeLineOfNodes: lineOfNodesWithPosition maxHeight: maxHeight