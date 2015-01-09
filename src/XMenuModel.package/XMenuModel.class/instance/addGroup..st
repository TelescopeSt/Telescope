protocol
addGroup: aBlock
	| group |
	
	group := XMenuGroupModel new.
	aBlock value: group.
	self addMenuGroup: group