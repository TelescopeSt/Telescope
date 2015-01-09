generation - interaction
generateClickInteraction: aClickInteraction onDrawable: aTLDrawable
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseLeftClick do: [ :evt | self executeInteraction: aClickInteraction forDrawable: aTLDrawable ]