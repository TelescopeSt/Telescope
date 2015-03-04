accessing
findAnEdgeToReplace: anEdgeWithANegativeCutValue tightTree: tightTree rankDictionary: rankDictionary
	| possibleEdges |
	possibleEdges := (self
		obtainExternalIncomingConnectionsFor:
			(self getNodesFrom: anEdgeWithANegativeCutValue fromNode ignoring: anEdgeWithANegativeCutValue tightTree: tightTree))
		\ {anEdgeWithANegativeCutValue}.
	^ possibleEdges detectMin: [ :anEdge | self slackForConnection: anEdge rankDictionary: rankDictionary ]