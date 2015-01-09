updating - node
updateElementNodeOf: aDrawable
	| element |
	element := self elementFromTLDrawable: aDrawable.
	element model: aDrawable entity.
	self update: element shape withTLShape: aDrawable shape.
	element update.
	