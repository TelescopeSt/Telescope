updating - node
updateElementNodeOf: aDrawable
	| element |
	element := self elementFromTLDrawable: aDrawable.
	element model: aDrawable entity.
	self flag: 'Shape changing not managed (from rectangle to circle for example)'.
	self customizeShape: element shape withStyleSheet: aDrawable effectiveStyleSheet.
	element update.
	