as yet unclassified
testInitRank
	| rankDictionary graph |
	graph := self createTelescopeGraphFrom: self graph1.
	rankDictionary := layout initRank: graph.
	self assert: (rankDictionary at: (graph nodeFromEntity: $a)) equals: 0.
	self assert: (rankDictionary at: (graph nodeFromEntity: $b)) equals: 1.
	self assert: (rankDictionary at: (graph nodeFromEntity: $c)) equals: 2.
	self assert: (rankDictionary at: (graph nodeFromEntity: $d)) equals: 3.
	self assert: (rankDictionary at: (graph nodeFromEntity: $e)) equals: 1.
	self assert: (rankDictionary at: (graph nodeFromEntity: $f)) equals: 1.
	self assert: (rankDictionary at: (graph nodeFromEntity: $g)) equals: 2.
	self assert: (rankDictionary at: (graph nodeFromEntity: $h)) equals: 4