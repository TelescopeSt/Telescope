tests
testCyclicGraphAccepted
	| nodes |
	nodes := (1 to: 3) collect: [ :i | context mock: 'child' , i asString ].
	nodes
		do: [ :node | 
			node can
				receive: #dimension;
				answers: 20 @ 20.
			node can
				receive: #isNode;
				answers: true.
			node can
				receive: #children;
				answers: {}.
			node can receive: #position:.
			node can
				receive: #occupyMaxSpace;
				answers: false.
			node can
				receive: #outgoingAdjacentNodes;
				answers: {(nodes after: node ifAbsent: [ nodes first ])} ].
	layout on: nodes