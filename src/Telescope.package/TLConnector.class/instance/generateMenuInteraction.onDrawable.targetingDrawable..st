generation - interaction
generateMenuInteraction: aMenuInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
	| menu |
	self flag: 'Telescope should create the menu and let the connector install it'.
	menu := self menuInteractionByDrawable at: aTLDrawable
		ifAbsentPut: [ self createMenuFor: aTLDrawable ].
	menu add: aMenuInteraction title
		target: [ self executeInteraction: aMenuInteraction forDrawable: aTargetDrawable ]
		selector: #cull:
		argument: aTargetDrawable entity
	