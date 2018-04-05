executing - interaction
executeInteraction: aKindOfInteraction onDrawableId: aDrawableId
	| drawable interactions |
	drawable := self tlDrawableFromId: aDrawableId.
	interactions := drawable allInteractions select: [ :anInteraction | anInteraction shouldOccursOn: aKindOfInteraction with: drawable ].
	
	interactions ifEmpty: [ ^ self sendAcknowledgeReceiptFor: drawable referencedElement ].
	
	self flag: 'dirty, will need a refactor'.
	aKindOfInteraction = #mouseOver ifTrue: [ ^ interactions do: [ :anInteraction | self executeRegularInteraction: anInteraction forDrawable: drawable ] ].
	
	"For the mouse out we reverse the interactions to execute them in the reverse order in which we activated them. It can help for example for style customization interactions because if we do not reverse them , then we will have a problem reversing the styles."
	aKindOfInteraction = #mouseOut ifTrue: [ ^ interactions reverse do: [ :anInteraction | self executeReverseInteraction: anInteraction forDrawable: drawable ] ].
	
	interactions do: [ :anInteraction | self executeInteraction: anInteraction forDrawable: drawable referencedElement ]