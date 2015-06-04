generation - interaction
generateMultiChoiceMenuInteraction: aTLMultiChoiceMenuInteraction onDrawable: aTLDrawable
	| menu subMenu |
	self flag: 'lack of consistency because actionOn: do not get a TLDrawable but the entity'.
	menu := self menuInteractionByDrawable at: aTLDrawable ifAbsentPut: [ self createMenuFor: aTLDrawable ].
	subMenu := TLLazyMenuMorph new.
	subMenu
		actionBlock: [ :entity | 
			| visualization |
			visualization := aTLDrawable visualization.	"we have to memorize the visualization because we are not sure the element will still be part of visualization after action"
			aTLMultiChoiceMenuInteraction actionOn: entity.
			visualization update ].
	subMenu childBlock: [ aTLMultiChoiceMenuInteraction choicesBlock value: aTLDrawable ].
	subMenu displayBlock: aTLMultiChoiceMenuInteraction displayBlock.
	menu add: aTLMultiChoiceMenuInteraction title subMenu: subMenu