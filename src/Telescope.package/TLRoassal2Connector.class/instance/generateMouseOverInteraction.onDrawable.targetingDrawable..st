generation - interaction
generateMouseOverInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable 
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseEnter do: [ :evt | self executeInteraction: aTLMouseOverInteraction forDrawable: aTargetDrawable].
	element when: TRMouseLeave do: [ :evt | self executeInteraction: aTLMouseOverInteraction forDrawable: aTargetDrawable].
	