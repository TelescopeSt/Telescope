generation - interaction
generateClickInteraction: aClickInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseLeftClick do: [ :evt | self executeInteraction: aClickInteraction forDrawable: aTargetDrawable ]