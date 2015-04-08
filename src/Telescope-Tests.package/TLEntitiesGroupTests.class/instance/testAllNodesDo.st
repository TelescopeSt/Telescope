as yet unclassified
testAllNodesDo
	| node1 node2 node3 |
	node1 := protocol mock: 'node1'.
	node2 := protocol mock: 'node2'.
	node3 := protocol mock: 'node3'.
	protocol describe
		allow: node1 recv: #parent:;
		allow: node2 recv: #parent:;
		allow: node3 recv: #parent:;
		allow: node1 recv: #isNode;
		=> true;
		allow: node2 recv: #isNode;
		=> true;
		allow: node3 recv: #isNode;
		=> true;
		once: node1 recv: #testMessage;
		once: node2 recv: #testMessage;
		once: node3 recv: #testMessage.
	protocol describe allow: parentMock recv: #requireUpdate.
	protocol describe allow: parentMock recv: #requireLayoutApplication.
	tlGroup > #subGroup addDrawable: node1.
	tlGroup addDrawable: node2.
	tlGroup > #subGroup > #subSubGroup addDrawable: node3.
	tlGroup allNodesDo: [ :aNode | aNode testMessage ]