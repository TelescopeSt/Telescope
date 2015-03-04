as yet unclassified
testComputeCutValueHeadTailForCinGraph1
	| graph |
	graph := self createTelescopeGraphFrom: self graph1.
	self
		assert:
			(layout computeCutValueHead: (graph nodesForEntities: #($a $b $c)) tail: (graph nodesForEntities: #($d $e $f $g $h)))
		equals: 3.
	self
		assert:
			(layout computeCutValueHead: (graph nodesForEntities: #($f)) tail: (graph nodesForEntities: #($a $b $c $d $e $g $h)))
		equals: 0.
	self
		assert:
			(layout computeCutValueHead: (graph nodesForEntities: #($e $f $g)) tail: (graph nodesForEntities: #($a $b $c $d $h)))
		equals: -1