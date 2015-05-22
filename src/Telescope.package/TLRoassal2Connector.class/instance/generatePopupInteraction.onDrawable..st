generation - interaction
generatePopupInteraction: aTLPopupInteraction onDrawable: aTLDrawable
	| element |
	element := self elementFromTLDrawable: aTLDrawable.
	element @ (RTPopup text: [ :assoc | aTLPopupInteraction text: aTLDrawable ])