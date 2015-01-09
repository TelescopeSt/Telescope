generation - interaction
createMenuFor: aTLDrawable
	| menu element |
	element := self elementFromTLDrawable: aTLDrawable.
	menu := MenuMorph new.
	
	element when: TRMouseRightClick do: [ :event |
		menu menuItems do: [ :sub | (sub subMenu class = TLLazyMenuMorph) ifTrue: [ sub subMenu computeIfNecessary ] ].
		menu popUpInWorld
	].
	^ menu