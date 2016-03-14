tests
testConnectGroupWithSubgroupToANode
	| connections  |
	group > #subgroup addNodesFromEntities: (5 to: 8).
	connections := group connectTo: TLSimpleNode new.
	self assert: connections size equals: 8.