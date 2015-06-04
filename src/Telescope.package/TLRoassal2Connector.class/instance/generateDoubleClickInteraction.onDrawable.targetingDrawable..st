generation - interaction
generateDoubleClickInteraction: aDoubleClickInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseDoubleLeftClick do: [ :evt | self executeInteraction: aDoubleClickInteraction forDrawable: aTargetDrawable]