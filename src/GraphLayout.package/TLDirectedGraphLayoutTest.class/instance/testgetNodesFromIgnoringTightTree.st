as yet unclassified
testgetNodesFromIgnoringTightTree
	|  graph tightTree nodes |
	graph := self createTelescopeGraphFrom: self graph1.
	tightTree := (self tightTreeForGraph1: graph).
	nodes := layout getNodesFrom: (graph nodeFromEntity: $c) ignoring: (graph nodeFromEntity: $c) outgoingConnections first tightTree: tightTree.
	self assert: (nodes collect:  #entity as: Set) equals: #($a $b $c) asSet.
	nodes := layout getNodesFrom: (graph nodeFromEntity: $d) ignoring: (graph nodeFromEntity: $c) outgoingConnections first tightTree: tightTree.
	self assert: (nodes collect:  #entity as: Set) equals: #($d $e $f $g $h) asSet.
	