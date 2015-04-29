generation - interaction
generateMouseOverInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable 
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element when: TRMouseEnter do: [ :evt | self executeInteraction: aTLMouseOverInteraction forDrawable: aTLDrawable].
	element when: TRMouseLeave do: [ :evt | self executeInteraction: aTLMouseOverInteraction forDrawable: aTLDrawable].
	