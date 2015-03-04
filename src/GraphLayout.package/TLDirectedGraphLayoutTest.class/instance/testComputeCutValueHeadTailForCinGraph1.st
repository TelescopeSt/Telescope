as yet unclassified
testComputeCutValueHeadTailForCinGraph1
	| graph |
	graph := self createTelescopeGraphFrom: self graph1.
	self
		assert:
			(layout computeCutValueHead: (graph nodesforEntities: #($a $b $c)) tail: (graph nodesforEntities: #($d $e $f $g $h)))
		equals: 3.
	self
		assert:
			(layout computeCutValueHead: (graph nodesforEntities: #($f)) tail: (graph nodesforEntities: #($a $b $c $d $e $g $h)))
		equals: 0.
	self
		assert:
			(layout computeCutValueHead: (graph nodesforEntities: #($e $f $g)) tail: (graph nodesforEntities: #($a $b $c $d $h)))
		equals: -1