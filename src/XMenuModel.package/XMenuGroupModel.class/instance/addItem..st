protocol
addItem: aBlock
	| item |
	
	item := XMenuItemModel new.
	aBlock value: item.
	self addMenuItem: item