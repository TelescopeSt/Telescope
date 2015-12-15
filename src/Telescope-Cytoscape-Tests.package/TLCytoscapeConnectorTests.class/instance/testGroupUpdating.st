as yet unclassified
testGroupUpdating
	| group |
	group := TLEntitiesGroup new.
	group
		nodeCreationStrategy: TLNodeCreationStrategy default;
		styleSheet: TLStyleSheet default.
	group addNodesFromEntities: (1 to: 5).
	group generator: connector.
	group generate.
	self assert: (connector elementFromTLDrawable: group) class equals: TLVirtualGroup.
	self assert: (connector elementFromTLDrawable: group) size equals: 5.
	group removeEntity: 3.
	connector updateGroup: group.	
	self assert: (connector elementFromTLDrawable: group) size equals: 4.
	