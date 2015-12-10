tests
testHideBlock
	| node hideAction secondNode connection |
	node := TLSimpleNode new.
	secondNode := TLSimpleNode new.
	connection := node connectTo: secondNode.
	hideAction := TLHideAction hide: [ :aNode | aNode allConnections ].
	self assert: connection isVisible.
	hideAction actionOn: node.
	self deny: connection isVisible