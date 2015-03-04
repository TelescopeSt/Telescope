as yet unclassified
testInitRank
	| rankDictionary graph |
	graph := self createTelescopeGraphFrom: self graph1.
	rankDictionary := layout initRank: graph.
	self assert: (rankDictionary at: (graph nodeForEntity: $a)) equals: 0.
	self assert: (rankDictionary at: (graph nodeForEntity: $b)) equals: 1.
	self assert: (rankDictionary at: (graph nodeForEntity: $c)) equals: 2.
	self assert: (rankDictionary at: (graph nodeForEntity: $d)) equals: 3.
	self assert: (rankDictionary at: (graph nodeForEntity: $e)) equals: 1.
	self assert: (rankDictionary at: (graph nodeForEntity: $f)) equals: 1.
	self assert: (rankDictionary at: (graph nodeForEntity: $g)) equals: 2.
	self assert: (rankDictionary at: (graph nodeForEntity: $h)) equals: 4