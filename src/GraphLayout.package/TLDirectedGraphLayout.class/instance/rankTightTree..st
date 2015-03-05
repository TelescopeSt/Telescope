accessing
rankTightTree: aTightTree
	| rankDictionary remainingConnections currentRank |
	remainingConnections := aTightTree copy.
	rankDictionary := Dictionary new.
	rankDictionary at: 0 put: (self findRootNodesFromTightTree: aTightTree).
	currentRank := 0.
	[remainingConnections notEmpty]
		whileTrue: [ 
			|selected|
			selected := remainingConnections
				select: [ :aConnection | (rankDictionary at: currentRank) includes: aConnection fromNode ].
			currentRank := currentRank + 1.
			rankDictionary at: currentRank put: (selected collectAsSet: #toNode).
			remainingConnections removeAll: selected ].
		^ rankDictionary 