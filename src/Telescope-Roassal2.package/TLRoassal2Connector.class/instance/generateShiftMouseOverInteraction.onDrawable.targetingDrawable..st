generation - interaction
generateShiftMouseOverInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable 
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseEnter do: [ :evt | (Sensor shiftPressed) ifTrue: [self executeInteraction: aTLMouseOverInteraction forDrawable: aTargetDrawable]].
	element when: TRMouseLeave do: [ :evt | (Sensor shiftPressed) ifTrue: [self executeInteraction: aTLMouseOverInteraction forDrawable: aTargetDrawable]].
	