accessing
tightTreeFor: aGraph ranks: aRankDictionary
	| tightTree tightTreeConnections |
	self flag: 'Does not return exactly the same tree than in paper'.
	tightTree := OrderedCollection new.
	tightTreeConnections := OrderedCollection new.
	tightTree add: aGraph nodes first.
	[ tightTree size < aGraph nodes size ]
		whileTrue: [ 
			| connection nodeToAdd delta |
			connection := (self obtainExternalConnectionsFor: tightTree)
				detectMin: [ :aConnection | self slackForConnection: aConnection rankDictionary: aRankDictionary ].
			delta := self slackForConnection: connection rankDictionary: aRankDictionary.
			(tightTree includes: connection fromNode)
				ifTrue: [ nodeToAdd := connection toNode ]
				ifFalse: [ 
					nodeToAdd := connection fromNode.
					delta := delta negated ].
			tightTree do: [ :aNode | aRankDictionary at: aNode put: (aRankDictionary at: aNode) + delta ].
			tightTree add: nodeToAdd.
			tightTreeConnections add: connection ].
	^ tightTreeConnections