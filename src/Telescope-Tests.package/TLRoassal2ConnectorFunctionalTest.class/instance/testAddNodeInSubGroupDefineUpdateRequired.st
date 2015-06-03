running
testAddNodeInSubGroupDefineUpdateRequired
	| group |
	group := TLEntitiesGroup new.
	group styleSheet: TLStyleSheet default.
	group > #subGroup addNodeFromEntity: 10.
	self assert: (group > #subGroup) isUpdateRequired.
	self assert: group isUpdateRequired.
	self assert: (group > #subGroup) isLayoutApplicationRequired.
	self assert: (group) isLayoutApplicationRequired.
	
	 