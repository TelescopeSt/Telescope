generation - interaction
generateDoubleClickInteraction: aDoubleClickInteraction onDrawable: aTLDrawable
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseDoubleLeftClick do: [ :evt | self executeInteraction: aDoubleClickInteraction forDrawable: aTLDrawable]