tests
testHideNode
	| node hideAction |
	node := TLSimpleNode new.
	hideAction := TLHideAction hide: node.
	self assert: node isVisible.
	hideAction actionOn: node.
	self deny: node isVisible