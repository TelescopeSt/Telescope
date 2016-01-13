as yet unclassified
testGroupUpdatingAfterMoving
	| groupA groupB node |
	groupA := TLEntitiesGroup new.
	groupA
		nodeCreationStrategy: TLNodeCreationStrategy default;
		styleSheet: TLStyleSheet default.
	groupB := TLEntitiesGroup new.
	groupB
		nodeCreationStrategy: TLNodeCreationStrategy default;
		styleSheet: TLStyleSheet default.
	node := groupA addNodeFromEntity: #1.
	groupA generator: connector.
	groupA generate.
	groupB generator: connector.
	groupB generate.
	self assert: (connector elementFromTLDrawable: node) parent equals: (connector elementFromTLDrawable: groupA).
	node moveToGroup: groupB.
	groupA update.
	groupB update.
	self assert: (connector elementFromTLDrawable: node) parent equals: (connector elementFromTLDrawable: groupB).
	