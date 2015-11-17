tests
testHideSymbol
	| node hideAction secondNode connection |
	node := TLSimpleNode new.
	node edgeBuilder: TLEdgeBuilder new.
	secondNode := TLSimpleNode new.
	connection := node connectTo: secondNode.
	hideAction := TLHideAction hide: #allConnections.
	self assert: connection isVisible.
	hideAction actionOn: node.
	self deny: connection isVisible