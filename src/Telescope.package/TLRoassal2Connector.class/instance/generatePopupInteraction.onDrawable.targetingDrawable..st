generation - interaction
generatePopupInteraction: aTLPopupInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element @ (RTPopup text: [ :assoc | aTLPopupInteraction text: aTargetDrawable ])