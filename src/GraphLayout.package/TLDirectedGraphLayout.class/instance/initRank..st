accessing
initRank: aGraph
	| rankDictionary toProceed |
	rankDictionary := Dictionary new.
	toProceed := aGraph nodes.
	[ toProceed notEmpty ]
		whileTrue: [ 
			| node |
			node := toProceed
				detect: [ :aNode | (aNode incomingConnections select: [ :aConnection | toProceed includes: aConnection fromNode ]) isEmpty ].
			rankDictionary
				at: node
				put: ((node incomingConnections max: [ :aConnection | rankDictionary at: aConnection fromNode ]) ifNil: [ -1 ]) + 1.
			toProceed remove: node ].
	^ rankDictionary