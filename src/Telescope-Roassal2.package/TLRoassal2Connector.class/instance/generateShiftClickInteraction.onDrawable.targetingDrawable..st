generation - interaction
generateShiftClickInteraction: aClickInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseLeftClick do: [ :evt | (Sensor shiftPressed) ifTrue: [self executeInteraction: aClickInteraction forDrawable: aTargetDrawable] ]