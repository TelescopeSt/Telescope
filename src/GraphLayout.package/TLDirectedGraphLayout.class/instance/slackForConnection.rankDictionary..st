accessing
slackForConnection: aConnection rankDictionary: aRankDictionary
	^ ((aRankDictionary at: aConnection fromNode) - (aRankDictionary at: aConnection toNode)) abs