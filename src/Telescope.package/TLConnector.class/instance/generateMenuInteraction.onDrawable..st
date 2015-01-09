generation - interaction
generateMenuInteraction: aMenuInteraction onDrawable: aTLDrawable
	| menu |
	self flag: 'Telescope should create the menu and let the connector install it'.
	menu := self menuInteractionByDrawable at: aTLDrawable
		ifAbsentPut: [ self createMenuFor: aTLDrawable ].
	menu add: aMenuInteraction title
		target: [ self executeInteraction: aMenuInteraction forDrawable: aTLDrawable ]
		selector: #cull:
		argument: aTLDrawable entity
	