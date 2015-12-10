as yet unclassified
testConnectGroupWithSubgroupFromANode
	| connections  |
	group > #subgroup addNodesFromEntities: (5 to: 8).
	connections := group connectFrom: TLSimpleNode new.
	self assert: connections size equals: 8.